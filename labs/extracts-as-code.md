# [Docs](../README.md) > [Labs](./index.md) > **Extracts-as-Code - Populate the data Lake with an open source pipeline**

`A Slalom DataOps Lab`

**Table of Contents:**

1. [Setup](#setup)
2. [Lab Instructions](#lab-instructions)
   1. [Step 1: Configure source system authentication](#step-1-configure-source-system-authentication)
   2. [Step 2: Create and test a rules file](#step-2-create-and-test-a-rules-file)
   3. [Step 3: Configure and deploy our infrastructure using Terraform](#step-3-configure-and-deploy-our-infrastructure-using-terraform)
   4. [Step 4: Explore the deployed AWS infrastructure using Terraform](#step-4-explore-the-deployed-aws-infrastructure-using-terraform)
   5. [Step 5: Run a sync test](#step-5-run-a-sync-test)
3. [Summary](#summary)
4. [Troubleshooting](#troubleshooting)
5. [See Also](#see-also)

## Setup

- One-time setup:
  - Installed software via:
    1. Core DevOps Tools: [http://docs.dataops.tk/setup](http://docs.dataops.tk/setup)
    2. AWS CLI:
        - `choco install awscli` (Windows)
        - `brew install awscli` (Mac)
    3. Tapdance extract tool:
        - `pip3 install slalom.dataops`
- Environment setup (each time):
  - Open browser tabs:
    1. The lab checklist (this page)
    2. [linux academy](https://app.linuxacademy.com/dashboard)
    3. [slalom-ggp/dataops-project-template](https://github.com/slalom-ggp/dataops-project-template)

## Lab Instructions

### Step 1: Configure source system authentication

#### Identify source and required settings

_For this lab, you will be extracting data from the Covid 19 tap `tap-covid-19` as
documented [here](https://github.com/singer-io/tap-covid-19). Before you start, take a
moment to become familiar with the provided documentation._

As documented on the Covid-19 Quick Start link
[here](https://github.com/singer-io/tap-covid-19#user-content-quick-start), the `covid-19`
tap requires at minimum the following settings:

- `api_token` - This is a GitHub token you will create which allows the tap to authenticate
  on your behalf and extract data from the [John Hopkins Covid-19 repo](https://github.com/CSSEGISandData/COVID-19).
- `user_agent` - This is simply any name and email address (e.g.
  `tap-covid-19 <api_user_email@your_company.com>`), which is again used to identify the
  tap as it uses the GitHub API to extract source data from the upstream source.
- `start_date` - A datetime stamp (e.g. `2019-01-01T00:00:00Z`) which is the _earliest_ date from which to
  start extracting data from the source.

All together, a sample config file for this tap looks like:

`covid-19-tap-config.json`

```json
{
    "api_token": "YOUR_GITHUB_API_TOKEN",
    "start_date": "2019-01-01T00:00:00Z",
    "user_agent": "tap-covid-19 <api_user_email@your_company.com>"
}
```

1. Navigate to the folder `data/taps/.secrets` and create a file called
   `tap-covid-19-config.json`.
2. Paste into the sample file config from above.
3. Override the second part of the `user_agent` string, replacing the sample email with
   your own email for purposes of identification.
4. Save the new file (`Ctrl+s`).

- **Note:** It is important this this file - and any other file containing secret keys -
  should not be committed to source control. In VS Code, you con confirm that your new file
  should appear grey in the file explorer and it _should not_ appear in the Git changes
  panel. This exclusion from git is accomplished due to the fact that contents of
  `.secrets` folder are explicitly and automatically excluded from Git using the
  `.gitignore` file, which is stored in the root of your repo.

#### Create a GitHub API token and save to `tap-covid-19-config.json`

_In this section, you will create a new GitHub token. As described above, this token allows
the tap to authenticate as you whenever it reads data from the Covid-19 dataset. Since it
only needs to read data from a public repo, we can give the token restricted permissions so
that it can only perform read-only actions._


1. Navigate to your [GitHub Tokens](https://github.com/settings/tokens) screen in GitHub.
2. Generate a new Token and grant the token `Read` access on `Public Repos`. In the 'Note'
   space, you can provide any text. For example, `covid-19 extracts` or `Cloud DE lab`.
       ![generate-token](resources/generate-covid-19-token.png)
3. Once created, copy the new key and paste it in as the `api_token` in your json config
   file.
4. Remember to save and close your config file once you have updated it with all three
   required settings.

### Step 2: Create and test a rules file

_The `tapdance` extract tool (part of `slalom.dataops`) is based on the
[Singer.io](https://singer.io) taps and targets paradigm, and it requires a rules file to
specify which tables and fields should be captured. In this section, you will create a very
simple rules file and then you will test the rules by creating a **plan** and confirming
the details of that plan file._

1. Open the sample rules file at `data/taps/data.select`, delete the entire file contents,
   including all Salesforce and Pardot references, and replace with the following single
   line:

      ```txt
      covid-19.*.*
      ```

     - This tells the `tapdance` tool we want to pull all tables and all columns from the
       `covid-19` tap.
2. Open a terminal in the folder `data/tap` by right-clicking the folder and selecting
   "Open in Terminal".
3. Run `s-tap plan covid-19` in the new terminal to update the extract plan file
     - If you do not have docker setup, or if docker is not able to access your local
       filesystem. First confirm docker is installed (`choco install docker-desktop` or
       `brew install docker`) and then check the Troubleshooting guide if you still
       receive an error.
     - Important: If docker is _still_ not working, you **do not** have to complete this
       step. You can safely continue on to the next steps and
4. Open the new file `tap-covid-19-plan.yml` and review the contents. You should see a list
   of to-be-extracted tables and columns.
     - Since we specified `covid-19.*.*` in our rules file, the resulting plan will include
       _all_ tables and columns.
5. Note that all of the tables contain a column called `git_owner` and a column called
   `git_html_url` - neither of which is needed for our analysis.
6. Re-open the file `data/taps/data.select` and add the following three lines to
   the bottom of the file:

      ```txt
      # Let's exclude the extra columns we don't need:
      !covid-19.*.git_owner
      !covid-19.*.git_html_url
      ```

     - The "`!`" symbols at the beginning of each line tells tapdance that we want to
       _exclude_ any columns that match these rules.
     - The `*` symbol in the second part of each rule specifies that we want this exclusion
       to be performed for any and all tables from the `covid-19` source that might have
       these columns.
7. Finally, ru-run the command `s-tap plan covid-19` and confirm the column
   exclusions in the extract plan file.

### Step 3: Configure and deploy our infrastructure using Terraform

_In this section, we will use a module from the Slalom Infrastructure Catalog which can
orchestrate Singer taps on AWS using ECS. We will need to provide the terraform module the
details on (1) where our tap configuration is stored (the `data/taps` folder), (2) what
credentials or secrets should be used during execution, (3) on what frequency the extracts
should be run, and (4) which target should be used to land the data._

1. Make sure your AWS credentials in `.secrets/aws-credentials` are correctly configured
   for Terraform.
   - If using Linux Academy AWS Sandbox:
     1. You may need to refresh your Sandbox environment and paste new credentials into the
        `aws-credentials` file, which is inside the `.secrets` folder at the root of the
        repo. For a refresher, see the instructions in the [previous lab](data-lake.md).
     2. If you've already run `terraform apply` and your sandbox has expired, you will
        need to delete the state file to avoid running into errors when trying to access
        now-expired credentials and resources. The state file is called `terraform.tfstate`
        and will be inside the `infra` folder.
2. Copy the sample `02_singer-taps.tf` file from the template project
   [here](https://github.com/slalom-ggp/dataops-project-template/blob/master/infra/02_singer-taps.tf)
   into your `infra` folder (assuming you have previously deleted it per instructions in
   the prior lab).
3. In the space provided for for `tap_id` (line 3), enter the text "covid-19". This
   indicates the source plugin `tap-covid-19`, which maps to
   [this repo](https://github.com/singer-io/tap-covid-19).
4. In the `secrets` section of the configuration, replace 'username' and 'password' with
   the name of two secrets in our json config file: `user_agent` and `api_token`,
   respectively.
5. Confirm your file against the sample [here](resources/covid-19-tap-sample-tf).
6. Open a terminal in the `infra` folder and run `terraform init --upgrade`. The
   `--upgrade` flag tells Terraform to pull down the latest versions of all upstream
   modules.
7. Run `terraform apply` to deploy the infrastructure.

### Step 4: Explore the deployed AWS infrastructure using Terraform

_At this point, your infrastructure has deployed successfully to AWS using Terraform. Let's
take a quick pause to investigate and review what has been deployed._

1. Open a new Terminal in the `infra` folder (or reuse an existing one).
2. Run `terraform show` to print a full output of the tracked Terraform resources.
3. Search (Ctrl+f) to find each of the following AWS resource types:
   - `aws_s3_bucket`
   - `aws_iam_role`
   - `aws_subnet`
4. In the file explorer, navigate to the file `terraform.tfstate` in the `infra` folder and
   open it. Search again for the above components, this time from within the state file.
5. Once you are done exploring, close the `terraform.tfstate` file and note that the file
   is greyed out in the file explorer. Just as with the secrets files we created, this file
   is likewise automatically excluded from git based upon rules in our project's
   `.gitignore` file.

### Step 5: Run a sync test

_At this point, your infrastructure has deployed successfully to AWS using Terraform.
According to the schedule defined, it will run automatically each day. However, instead of waiting until the next execution, we will now kick off the extract manually using ECS and the AWS command line ("awscli")._

1. Open a new Terminal in the `infra` folder (or reuse an existing one).
2. If you are on Windows and your terminal is a PowerShell terminal, type `cmd` into the
   terminal and and press `<enter>` to switch back to Command Prompt. (PowerShell is not
   yet supported for the next "User Switch" step.)
3. Run `terraform output` from the `infra` folder in order to print out the Terraforms
   output variables.
4. From the terraform output, copy-paste and then run the provided `AWS User Switch`
   command. (This helps the AWS CLI locate our credentials.)
5. Copy-paste and run the `Sync command` from the Terraform output. This will manually
   execute the Pardot sync in ECS.
6. Click on the `Logging URL` link in the Terraform output to open CloudWatch logs in a
   web browser.
7. Wait one or two minutes for the ECS task to start.
8. If the job kicks off successfully, you will see logs begin to appear after 1-2 minutes.
9. Once logs are coming through into CloudWatch, navigate to the S3 Service in your AWS Web
   Console and open the data bucket. Explore the new data files and folder which are landing
   there in S3.

## Summary

_Congratulations! You've created a fully automated data extract pipeline in an hour or
less, which can now be instantly deployed to any AWS environment. If new columns and tables
are added to our source in the future, they will automatically be included so long as they match our specified rules. If columns are dropped or renamed, the data may become out of
sync with our plan file, but the extraction itself will continue running regardless of
upstream changes. Similarly, we've avoided any hard-coding of data types and our process
will therefor be resilient to any upstream data type changes which may occur in the
future._

<!--
## Extra Credit

_The below exercises are NOT required for the lab completion. These are designed for those
individuals who might want additional practice or who want to try out additional
experiments._

-->

## Troubleshooting

1. Error during `terraform apply`: `The given key does not identify an element in this collection value. ...  )[split(":", location)[1]]`
    - This is most likely due to missing overrides for the Covid-19 secrets (aka credentials).
    - To resolve, double check that you have replaced all instances of `username` and `password` with `api_token` and `user_agent`, respectively, in `02_singer-taps.tf`.
2. `TaskDefinition not found.`
    - This is most likely due to not having run the `AWS Switch Command`. Or it is not running properly.

## See Also

- [Original Lab Text](https://github.com/slalom-ggp/dataops-infra/issues/86)
