# Salesforce Data Integration Guide

_**Important notes before you start:**_

* _There are many ways to extract data from Salesforce. The method described here is designed to be easy, flexible, scalable, and stable._
* _Azure and GCP are not yet supported. If you are interested in contributing, please see [this ticket](TK) for AWS or [this ticket](TK) for GCP._

## Background Info

### 1. Salesforce Data Challenges

The largest challenge when working with Salesforce data is that because Salesforce gives you so much control over the data modules, no two instances of Salesforce are 100% alike. Indeed, the flexible nature of Salesforce as a platform means that columns are going to be added, renamed, or dropped many times during the lifecycle of your data pipeline.

In traditional architectures, these changes represent significant risk and fragility, as each change to the schema will either be simply ignored (best case) or it will break the data pipeline and cause it to fail (worst case).

### 2. About Singer Taps

Singer Taps is the recommended platform for the following reasons:

1. Supports CI/CD frameworks.
2. Does not break when Salesforce source columns change.
3. Provides a flexible rules-based approach by which tables and columns are selected or ignored.

## Instructions

### Overview

The below steps will accomplish 4 keys steps:

1. Define the extract rules in a `data.select` file.
2. Test the extract rules by creating a plan file (`data-plan-salesforce.yml`).
3. Configure the target S3 location.

### Prereqs: Install the Tools

To install the tools, run the following command.

```bash
pip install slalom.dataops
```

### Step 1: Configure the Extracts

1. **Create a folder** for your taps, or start with the [dataops-template-project](https://github.com/slalom-ggp/dataops-project-template) and navigate to the [`data/taps`](https://github.com/slalom-ggp/dataops-project-template/tree/master/data/taps) folder.
2. **Create a select file** in the `taps` folder called `data.select` or start with the sample file [here](https://raw.githubusercontent.com/slalom-ggp/dataops-project-template/master/data/taps/data.select). (If starting with the sample file, you can optionally delete the block in the sample referring to 'Pardot'.)
3. **Test your select file** by running the following command from the `taps` directory:

    ```bash
    s-tap plan salesforce .
    ```

4. **Confirm the generated plan file** which will be called `data-plan-salesforce.yml`. If the correct columns and tables are selected or ignored, move on to the next step. If not, repeat steps 2 and 3 until the plan matches your specific data requirements.
   * _You can also compare with the sample plan file [here](https://github.com/slalom-ggp/dataops-project-template/blob/master/data/taps/data-plan-salesforce.yml)._

5. Once the plan is correct, run the following command to run the data extraction process:

    ```bash
    s-tap sync --target_name=s3-csv salesforce *
    ```

_If data is extracted successfully, congratulations! You are ready to load into the data lake._

### Step 2: Configure S3 Loads

1. **Create a new file** called `sync.sh` with the following contents:

    ```bash
    # Configure S3 CSV target:

    export TARGET_S3_CSV_aws_access_key_id=$AWS_ACCESS_KEY_ID
    export TARGET_S3_CSV_aws_secret_access_key=$AWS_SECRET_ACCESS_KEY
    export TARGET_S3_CSV_bucket_name=propensity-to-buy
    export TARGET_S3_CSV_s3_key_prefix=sync-test/

    # Optionally configure encryption and/or compression:

    # By default, encryption will match the bucket default. For custom KMS encryption, uncomment the below and paste in a custom KMS key ID:
    # export TARGET_S3_CSV_encryption_type=kms
    # export TARGET_S3_CSV_encryption_key=your-key-here
    # By default, files are not compressed. To gzip the result (.csv.gz), uncomment the below:
    # export TARGET_S3_CSV_compression=gzip

    # Run the extracts:

    s-tap sync --target_name=s3-csv salesforce Account
    ```

2. **Update the script** to use your own S3 bucket and paths, optionally adding compression/encryption options.
3. **Run the script** and check the S3 bucket for your new files.

### Step 3: Productionalize the Extract-Load Pipeline

1. If you have not already done so, make sure your commit the following three files to git: `data.select`, `data-plan-salesforce.yml` and `sync.sh`
   * _**Do not** commit any file that contains your passwords or keys, and do not commit the generated `.json` catalog files._
2. You can now schedule the sync.sh job to run on a daily cadence, or more frequently as desired.
