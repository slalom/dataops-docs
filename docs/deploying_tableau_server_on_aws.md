# Deploying a Secure Tableau Server on AWS

This walkthrough is divided into four parts:

* [Install Prereqs](#Install%20Prereqs) _(20 minutes)_
* [Deploy](#Deploy) _(10 minutes)_
* [Config and Test](#Config%20and%20Test) _(30 minutes)_
* [Shut it Down](#Shut%20It%20Down) _(1 minute)_

_**Time Requirement:** 60 minutes total_

## Install Prereqs

_**Time Requirement:** 20 minutes_

_**Overview:** This section walks through getting software installed and getting AWS-related credentials stored correctly. **These steps only need to be done once.** Complete this section before continuing to the next section._

1. **Install Dev Tools**
    * Install minimal toolset from Command Prompt as administator (via [Chocolatey](chocolatey.org)):

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
        * `tableau_server`: `true` - otherwise no Tableau server will be launched.
        * `region`: `us-east-2` (match your selected region if not using the default)
        * `project_shortname`: preferrably something short and unique like `AJTableau` `TableauTest` (special characters not allowed)
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

_**Time Requirement:** 10 minutes_

_**Overview:** This section covers the configuration and deployment of Terraform "Infrastructure as Code" (IAC)._

1. Confirm the settings configured in the previous step.

    ```bat
    cd C:\Files\Source\dataops-tools\infra
    code config.yml
    ```

1. Deploy the infrastructure using [terraform](https://terraform.io).

    ```bat
    cd C:\Files\Source\dataops-tools\infra
    terraform init
    terraform plan
    terraform apply -auto-approve
    ```

## Config and Test

_**Expected Time:** 30 minutes_

_**Overview:** After `terraform apply` is successfully executed, the next step is to log into the EC2 instance and complete server setup._

* **NOTE:** Future updates to the Terraform scripts will significantly reduce the number of steps needed in this section.

1. **Connect to the remote EC2 instance.**
    * After running either `terraform apply` or `terraform output`, copy either `tableau_server_windows_rdp_command` (Windows) or `tableau_server_linux_ssh_command` (Linux).
    * Paste the command into a terminal and run from your local machine. This will connect you to the new Tableau server via an RDP session (Windows) or an ssh terminal session (Linux).
        * _NOTE: You can also run `terraform output tableau_server_windows_rdp_command` or `terraform output tableau_server_linux_ssh_command` to quickly print just the command you need._
2. **Install and Configure Tableau Server**
    * Navigate to the `tableau` folder containing the installers and configuration scripts for Tableau Server. This folder is located at `C:\Users\Administator\tableau` on Windows and `/home/ubuntu/tableau` on Linux.
    * If Tableau is not yet installed, run the desired version of the installer.
    * On Windows, login to https://localhost:8850 after installing to configure Tableau Server Manager (TSM) and launch the server.
3. **Connect and test from your local workstation**
    * After completing the above, you should now be able to connect to Tableau Server via the provided public ip address. If you have difficulties connecting, try again using both `http://` and `https://` prefixes before the IP address. You should not need to specify a port number in the URL but the default port is port 80.

## Shut It Down

_**Expected Time:** 1 minute_

_**Overview:** Once your testing is complete, don't forget to shut down the resources and avoid large AWS bill. Luckily, this only takes a single command to shut everything off._

1. Run `terraform destroy`

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

This section contains additional info which might be helpful, but is not required for all users or use cases.

### Understanding how this works

* To get a better understanding of how this works to deploy a full environment in terraform, explore the code files in the `infra` folder of the `dataops-tools` repo, starting the files `infra/main.tf` and `infra/modules/aws-tableau/main.tf`.
* For information specifically on the Tableau Server config, see `infra/modules/aws-tableau/userdata_win.bat` (Windows) and `infra/modules/aws-tableau/userdata_lin.sh` (Linux).

### Securely storing secrets within AWS (Optional Step)

_**NOTE:** No secrets are currently needed for the install process itself._

* Login to AWS and navigate to the "Secrets Manager" service.
* *Important:* ensure you are logging into the AWS region you selected in the step above. _(Secrets are regionalized by AWS, which means they are only available in the region in which they are created.)_
* Select the option to "Store a new secret"
* Select "Other type of secrets" and enter the following secrets:

    ```yaml
    TK - Update which secrets should go here.
    AWS_ACCESS_KEY_ID:     123456***
    AWS_SECRET_ACCESS_KEY: adfc1!***
    ```

* Use the default encryption key unless you have another encryption key you prefer.
* Click "Next" and name the secret collection as `TableauServer/demo` or similar.
* The remaining settings should use their provided defaults. Click "Next" until you have completed the wizard.

## Selecting an AWS region for your project

Due to better pricing and availability, `us-west-2 (Oregon)` is generally recommended for most use cases. The next best option is usually `us-east-2 (Ohio)` for clients and offices running on the East coast.

* _**Note:** While it's good practice to put the server on the same coast as the targeted end-users, the more important latency to optimize for is the distance between your BI server and your relational database or data warehouse. For instance, if you are pulling large amounts of data from Redshift, first find out which region that instance resides in and try to match that region if at all possible. This traffic will represent the largest factor in network performance._
