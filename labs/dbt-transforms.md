# [Docs](../README.md) > [Labs](./index.md) > **Use CI/CD and DBT to Deploy a Transformation Pipeline**

`A Slalom DataOps Lab`

> _**WARNING: Lab Still Under Construction**_

## Prep and Prereqs

* **Prep:** For this lab, you'll need:
  1. [Installed DevOps Tools](../setup.html):
     * VS Code, Python, Docker, and Terraform
  2. [A GitHub account](./intro)
* **Prereqs:**
  * This module starts off where the previous module ended. To get caught up, go to the
    [previous lab](rds-database.md) or go back to the [main labs page](./index.md).

## Lab Steps

### Step 1: Add DBT infrastructure config

From the [DBT Module Sample](https://github.com/slalom-ggp/dataops-infra/blob/master/samples/dbt-and-singer-on-aws/03_data-build-tool.tf):

```tf
module "dbt_on_aws" {
  # BOILERPLATE HEADER (NO NEED TO CHANGE):
  source        = "git::https://github.com/slalom-ggp/dataops-infra.git//catalog/aws/dbt?ref=master"
  name_prefix   = local.name_prefix
  environment   = module.env.environment
  resource_tags = local.resource_tags

  # ADD OR MODIFY CONFIGURATION HERE:

  container_image         = "slalomggp/dataops:test-project-latest-dev"
  dbt_run_command         = "./gradlew dbtSeed dbtCompile dbtRun"
  scheduled_timezone      = "PST"
  scheduled_refresh_times = ["0300", "1200", "1800"]
  environment_vars        = {}

  /* OPTIONALLY, COPY-PASTE ADDITIONAL SETTINGS FROM BELOW:

  scheduled_refresh_interval = "1 minute"

  */
}

# BOILERPLATE OUTPUT (NO NEED TO CHANGE):
output "dbt_summary" { value = module.dbt_on_aws.summary }
```

### Step 2: Add some transforms

Create a new file with the SQL Transform logic:

`data/transforms/my-project/new_table.sql`:

```sql
SELECT
    cast(1 as int)              AS ColA
  , cast('A' as varchar (20))   AS ColB
UNION ALL
SELECT
    cast(2 as int)              AS ColA
  , cast('B' as varchar (20))   AS ColB
UNION ALL
SELECT
    cast(3 as int)              AS ColA
  , cast('C' as varchar (20))   AS ColB
```

### Step 3: Run the transform pipeline

1. Run `terraform output` in a terminal window.
2. Copy-Paste and run the DBT run command.

### Step 4: Configure and Test CI/CD

1. Rename all files at `.github/workflows/*.template`, removing the `.template` suffix.
2. Commit and push your code.
3. Navigate to your project in GitHub and click the "Actions" tab.
4. Monitor each CI/CD task, noting which are successful and which have errors.
5. Open and debug any errors you see in the Actions CI/CD log.
