# [Docs](../README.md) > [Labs](./index.md) > **Deploy a Managed Database on RDS**

`A Slalom DataOps Lab`

## Prereqs and Prep

### Prereqs

For this lab, you'll need:

  1. [Installed DevOps Tools](../setup/index.html):
     - VS Code, Python, and Terraform
  2. [A GitHub account](./intro.md)
  3. [DBeaver Universal Database Tool](https://dbeaver.io)
     - On Mac: `brew cask install dbeaver-commmunity`
     - On Windows: `choco install dbeaver`

### Prep: Initialize Your Project and Configure AWS Credentials

**Option A: Start from Previous Lab (Recommended):**

> Use this option if you've already completed the previous lab, and have successfully
run `terraform apply`.

_If you've completed the previous lab, and if you used the recommended [Linux Academy
Playground](https://playground.linuxacademy.com) to do so, you're 4-hour limited AWS
environment has likely been reset. Follow these instructions to get a new environment
and reset your git repo to use this new account._

1. Create a new AWS Sandbox environment at
   [playground.linuxacademy.com](https://playground.linuxacademy.com).
2. Update your credentials file (`.secrets/aws-credentials`) with the newly provided
   Access Key ID and Secret Access Key.
3. Navigate to your `infra` folder and delete the file named `terraform.tfstate`.
   - _**IMPORTANT:** In a real-world environment, you never want to delete or corrupt your
     "tfstate" file, since that is the means Terraform uses to keep track of the
     infrastructure it has created. In this unique case, however, our environment has been
     already been purged by the Linux Academy 4-hour time limit, and by deleting this file
     we are able to start fresh in a new account._

_That's it! You should now be able to run `terraform apply` again, which will
recreate the same baseline environment you created in the previous
"[data-lake](./data-lake.md)" lab._

**Option B: Starting from Scratch:**

_If you've not yet completed the [data lake lab](./data-lake.md), go back and do so now. (You
can safely skip all exercises labeled "Extra Credit".)_

## Lab Steps

### Step 1: Add RDS infrastructure config

1. Creat a new file called `02_databases.tf` in your `infra` folder.
2. Copy-paste the following code into your new file:

   ```tf
   module "postgres" {
     source        = "git::https://github.com/slalom-ggp/dataops-infra.git//catalog/aws/postgres?ref=main"
     name_prefix   = "${local.name_prefix}postgres-"
     environment   = module.env.environment
     resource_tags = local.resource_tags

     identifier          = "my-postgres-db"
     admin_username      = "postgresadmin"
     admin_password      = "asdfASDF12"
     skip_final_snapshot = true
   }
   output "postgres_summary" { value = module.postgres.summary }
   ```

3. Review the configuration variables in the module and compare with the full list of configuration options in the documentation [here](https://infra.dataops.tk/catalog/aws/postgres/#optional-inputs).

### Step 2: Deploy using Terraform

1. Open a new terminal in the `infra` folder (Right-click `infra` folder and select `Open in Integrated Terminal`).
2. Run `terraform init --upgrade` and then run `terraform apply` to deploy your changes changes.
   - Note that if you've already deployed the data lake lab, no changes will be proposed to S3 buckets, the VPC, or the Subnets.

### Step 3: Connect to Your New Database

1. Using DBeaver and the connection information provided by `terraform output`, connect to your new database.
2. In a new SQL Editor tab (`SQL Editor` menu -> `New SQL Editor`), paste and run the following commands to test that the database is working properly.

   ```sql
   create table test_table as select 42 as TheAnswer, 'N/A' as TheQuestion;
   select * from test_table;
   ```

### Step 3: Examine the Source Code and Documentation

_In this section, you will explore the Terraform source code used in the terraform RDS and
Redshift modules._

1. Navigate to the Terraform doc to review the full set of options for RDS and Redshift:
   1. [MySQL and Postgres RDS docs](https://www.terraform.io/docs/providers/aws/d/db_instance.html)
   2. [Redshift docs](https://www.terraform.io/docs/providers/aws/r/redshift_cluster.html)
2. In a new tab, compare the above with the source code of the respective Infrastructure Catalog modules:
   3. [RDS](https://github.com/slalom-ggp/dataops-infra/blob/main/components/aws/rds/main.tf)
   4. [Redshift](https://github.com/slalom-ggp/dataops-infra/blob/main/components/aws/redshift/main.tf)
3. Lastly, compare and contrast how the below two files each use the same "RDS" module to deploy the two different database platforms (note the difference in lines 21-22 of each file).
   1. [MySQL](https://github.com/slalom-ggp/dataops-infra/blob/main/catalog/aws/mysql/main.tf)
   2. [Postgres](https://github.com/slalom-ggp/dataops-infra/blob/main/catalog/aws/postgres/main.tf)

## Extra Credit Options

### EC Option 1: Migrate from Postgres to Redshift

> _NOTE: The steps below also work with MySQL. Simply replace all `redshift` references with `mysql`._

_In this step, you'll create a new Redshift cluster in the same way you created a Postgres database._

**Option 1: Search and Replace:**

1. In VS Code, click anywhere in the `02_databases.tf` file and use `Ctrl+H` to open the search-and-replace tool.
2. Type "postgres" in the first box and "redshift" in the second box. Then use the `Replace` or `Replace All` buttons to modify your code.
3. Remember to save your file with `Ctrl+S`.
4. Run `terraform init` and `terraform apply` to deploy your new database.

**Option 2: Add to Existing:**

1. At the end of the `02_databases.tf` file, paste in the code below. This will add on the additional Redshift deployment to your existing configuration.

   ```tf
   module "redshift" {
     source        = "git::https://github.com/slalom-ggp/dataops-infra.git//catalog/aws/redshift?ref=main"
     name_prefix   = "${local.name_prefix}redshift-"
     environment   = module.env.environment
     resource_tags = local.resource_tags

     identifier          = "my-redshift-db"
     admin_username      = "redshiftadmin"
     admin_password      = "asdfASDF12"
     skip_final_snapshot = true
   }
   output "redshift_summary" { value = module.redshift.summary }
   ```

### EC Option 2: Explore the Samples

Optionally, you can explore the below Infrastructure Catalog samples. Note the
similarities to your own configurations.

- [mysql sample](https://github.com/slalom-ggp/dataops-infra/blob/main/samples/mysql-on-aws/01_rds_mysql.tf)
- [postgres sample](https://github.com/slalom-ggp/dataops-infra/blob/main/samples/postgres-on-aws/01_rds_postgres.tf)
- [redshift sample](https://github.com/slalom-ggp/dataops-infra/blob/main/samples/redshift-dw/02_redshift.tf)

## Troubleshooting

For troubleshooting tips, please see the [Lab Troubleshooting Guide](troubleshooting.md).
