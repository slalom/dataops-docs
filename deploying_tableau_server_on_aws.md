# Deploying a Secure Tableau Server on AWS

<!-- markdownlint-disable MD033 - no-inline-html -->

This walkthrough is divided into four parts:

- [Install Prereqs](#install-prereqs) _(20 minutes)_
- [Deploy](#deploy) _(5 minutes)_
- [Connect and Test](#connect-and-test) _(10 minutes)_
- [Shut It Down](#shut-it-down) _(1 minute)_

_**Time Requirement:** <45 minutes (total)_

## Install Prereqs

_**Time Requirement:** 20 minutes_

_**Overview:** This section walks through getting software installed and getting AWS-related credentials stored correctly. **These steps only need to be done once.** Complete this section before continuing to the next section._

1. **Install Dev Tools**
    * Install minimal toolset from Command Prompt as administator (via [Chocolatey](https://chocolatey.org)):

      ```bat
      @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
      ```

      ```bat
      choco install -y awscli terraform vscode
      ```

    * Or install the full set of recommended tools using the [Windows Development Quickstart](windows_development.md)

1. **Clone the git repo: `dataops-tools`**
    * The following commands will clone the dataops-tools repo into `c:\Files\Source\dataops-tools`:

      ```bash
      cd / && mkdir Files & cd Files & mkdir Source & cd Source
      git clone https://github.com/slalom-ggp/dataops-tools.git
      ```

1. **Customize deployment settings**
    * In the newly cloned repo, edit `infra/settings.yml` to match your desired setup:

      ```bat
      cd C:\Files\Source\dataops-tools\infra
      code config.yml
      ```

    * Edit or confirm the following four settings:
        * `tableau_windows_servers`: `1`
        * `tableau_linux_servers`: `1`
        * `region`: `us-east-2` (match your selected region if not using the default)
        * `project_shortname`: preferrably something short and unique like `AlexTableau` `TableauTest` (special characters not allowed)
        * `prefer_fargate`: `true` (otherwise will cause charges related to an always-on ECS cluster)

1. **Configure AWS on your local machine**

    * Follow [these instructions](https://docs.aws.amazon.com/cli/latest/userguide/install-windows.html) from Amazon on how to install and configure the AWS CLI on your local development machine.
    * As part of this install, you should create one text file called `credentials` and one called `config` in an `.aws` subfolder within your local user profile folder
        * The `~/.aws/credentials` file should look like:

          ```ini
          AWS_ACCESS_KEY_ID=123132a******
          AWS_SECRET_ACCESS_KEY=asdfasdfasd*****
          ```

        * The `~/.aws/config` file should look like:

          ```ini
          [default]
          AWS_DEFAULT_REGION=us-west-2
          ```

        * To find the profile folder on Windows: `Win+R`>`%USERPROFILE%`>`<ENTER>`
    * If you do not yet have a user credential pair, you will need to create a new AWS user before you can continue to the next step.

## Deploy

_**Time Requirement:** 5 minutes_

_**Overview:** This section covers the configuration and deployment of Terraform "Infrastructure as Code" (IAC)._

1. Confirm the settings configured in the previous step.

    ```bat
    cd C:\Files\Source\dataops-tools\infra & code config.yml
    ```

2. Deploy the infrastructure using [terraform](https://terraform.io).

    ```bat
    cd C:\Files\Source\dataops-tools\infra
    terraform init
    terraform plan
    terraform apply -auto-approve
    ```

3. Watch and wait...

    * The `terraform apply` statement should take **2-3 minutes**, and afterwards will print login information for how to connect to the AWS instances. If you need to see these again, simply run `terraform output` which will print the outputs again without changing the deployment.
    * After the instance is started, Tableau takes another **15-20 minutes** to fully configure and install. Go get a coffee, and/or watch the logs by jumping ahead to the next step and following banner instructions to monitor (aka "tail") the setup logs.

## Connect and Test

_**Expected Time:** 10 minutes_

_**Overview:** After `terraform apply` is successfully executed (2-3 minutes) and after the tableau install scripts have completed (another 15-20 minutes), you should be able to log into the new EC2 instance and complete server setup._

1. **Connect to the remote EC2 instance.**
    * After running either `terraform apply` (or `terraform output`), copy `tableau_server_windows_rdp_command` (Windows) or `tableau_server_linux_ssh_command` (Linux) into your terminal and press enter.
    * Once logged in, follow the instructions in the banner message to tail the install log. If everything runs successfully, you will see two marker files in the scrips folder: `_INIT_STARTED_` and `_INIT_COMPLETE_`. (You can check the timestamps on these files in order to calculate how long the scripts ran, generally around 16 minutes.)
    * Paste the command into a terminal and run from your local machine. This will connect you to the new Tableau server via an RDP session (Windows) or an ssh terminal session (Linux).
2. **Connect and test from your local workstation**
    * After the automated install completes, you should be able to connect to Tableau Server via the provided public ip address. By default, TSM uses `https://[my_ip]:8850` and the Tableau Server itself uses `http://[my_ip]`

## Shut It Down

_**Expected Time:** 1 minute_

_**Overview:** Once your testing is complete, don't forget to shut down the resources and avoid large AWS bill. Luckily, this only takes a single command to shut everything off._

1. Run `terraform destroy` OR reduce instance counts.

    ```bat
    cd c:\Files\Source\dataops-tools\infra
    terraform destroy -auto-approve
    ```

2. **You're done!** (There is no step 2.) 😎

    * Repeat from the [Deploy](#Deploy) step to start again.

--------------

### Help us improve

* The `dataops-tools` repo and this one (`dataops-quickstart`) are both public and GitHub provides two mechanisms to help us continually improve:
  * **Pull Requests** - for code contributions
  * **Issues** - for submitting bugs and proposed enhancements

--------------

## Appendix

_This section contains additional information which might be helpful, but is not required for all users or use cases._

<details><summary>
<b>Understanding how this works</b>
</summary>
<p><p>

* To get a better understanding of how this works to deploy a full environment in terraform, explore the code files in the `infra` folder of the `dataops-tools` repo, starting the files `infra/main.tf` and `infra/modules/aws-tableau/main.tf`.
* For information specifically on the Tableau Server config, see `infra/modules/aws-tableau/userdata_win.bat` (Windows) and `infra/modules/aws-tableau/userdata_lin.sh` (Linux).

</details>
<p>

<details><summary>
<b>Testing different versions of the setup scripts</b>
</summary>
<p><p>

Whenever you modify the setup scripts in `infra/modules/aws-tableau` and then run `terraform apply`, terraform will detect the change to the script and will automatically rebuild the environment using the updated scripts. This means you can test different script options and configurations and rebuild everything in a single command.

**Proceed with Caution:** While fully rebuilding the environment from scratch is extremely powerful, it also means you will be starting over from scratch each time. You will lose all settings, tableau workbooks, and data files which you may have deployed to the server(s).

</details>
<p>

<details><summary>
<b>Customizing the Server Config</b>
</summary>
<p><p>

* Log in to the instance using ssh or rdp, as described above
* Follow the instructions in the welcome banner to locate the correct files for configuration.

</details>
<p>

<details><summary>
<b>Securely storing secrets within AWS (Optional Step)</b>
</summary>
<p><p>

_**NOTE:** No secrets are currently needed for the install process itself._

* Login to AWS and navigate to the "Secrets Manager" service.
* *Important:* ensure you are logging into the AWS region you selected in the step above. _(Secrets are regionalized by AWS, which means they are only available in the region in which they are created.)_
* Select the option to "Store a new secret"
* Select "Other type of secrets" and enter the following secrets:

  ```yaml
  AWS_ACCESS_KEY_ID:     123456***
  AWS_SECRET_ACCESS_KEY: adfc1!***
  ```

* Use the default encryption key unless you have another encryption key you prefer.
* Click "Next" and name the secret collection as `TableauServer/demo` or similar.
* The remaining settings should use their provided defaults. Click "Next" until you have completed the wizard.

</details>
<p>

<details><summary>
<b>Selecting an AWS region for your project</b>
</summary>
<p><p>

Due to better pricing and availability, `us-west-2 (Oregon)` is generally recommended for most use cases. The next best option is usually `us-east-2 (Ohio)` for clients and offices running on the East coast.

* _**Note:** While it's good practice to put the server on the same coast as the targeted end-users, the more important latency to optimize for is the distance between your BI server and your relational database or data warehouse. For instance, if you are pulling large amounts of data from Redshift, first find out which region that instance resides in and try to match that region if at all possible. This traffic will represent the largest factor in network performance._

</details>
