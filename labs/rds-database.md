# [Docs](../README.md) > [Labs](./index.md) > **Deploy a Managed Database on RDS**

`A Slalom DataOps Lab`

> _**WARNING: Lab Still Under Construction**_

## Prep and Prereqs

* **Prep:** For this lab, you'll need:
  1. [Installed DevOps Tools](../setup/index.html):
     * VS Code, Python, Docker, and Terraform
  2. [A GitHub account](./intro.md)
* **Prereqs:**
  * This module starts off where the previous module ended. To get caught up, go to the
    [previous lab](./extracts-as-code.md) or go back to the [main labs page](./index.md).

## Lab Steps

### Step 1: Add RDS infrastructure config

1. Copy-Paste any one of the following into a new file in your infrastructure folder:
   * [mysql sample](https://github.com/slalom-ggp/dataops-infra/blob/master/samples/mysql-on-aws/01_rds_mysql.tf)
   * [postgres sample](https://github.com/slalom-ggp/dataops-infra/blob/master/samples/postgres-on-aws/01_rds_postgres.tf)
   * [redshift sample](https://github.com/slalom-ggp/dataops-infra/blob/master/samples/redshift-dw/02_redshift.tf)
2. Customize the configuration variables in the module.
3. Delete any unused/unwanted configuration options or comments.

### Step 2: Deploy using Terraform

1. Open a new terminal in the `infra` folder.
2. Run `terraform init --upgrade` and then run `terraform apply` to apply the schema changes.
3. Log into the AWS Console to confirm the database is created successfully.

<!--

### Step 3: Add an automated load to the new database

1. Open the `singer-taps.tf` file created in the previous lab.
2. Add a `target` block into the singer-taps module, starting from the following sample code:

    ```tf
      ...
      target = {
        ...
      }
      ...
    ```

### Step 4: Run the database load

1. Open a terminal in your `infra` folder.
2. Run `terraform init && terraform apply`. When asked to confirm, type 'yes' to deploy the changes.
3. Run `terraform output`.
4. Copy-paste and run the singer database load command.

-->
