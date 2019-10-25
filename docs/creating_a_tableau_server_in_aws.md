# Creating a Secure Tableau Server in AWS

_This walkthrough is broken into thress parts:

* [Prereqs](#Prereqs)
* [Installation](#Installation)
* [Config](#Config)

## Prereqs

1. **Collect the info you need.**

    * **Select an AWS region for your project.** Because of better pricing and availability, we  recommend `us-west-2 (Oregon)` for most use cases. The next best option is usually `us-east-2 (Ohio)` for clients and offices running on the East coast.
        * _**Note:** While it's nice to be on the same coast are your end-users, the most important latency to optimize for is the distance between your BI server and your relational database - this will represent the most networking delay. For instance, if you are pulling large amounts of data from Redshift, first find out which region that instance resides in and try to match that region if at all possible._

2. **Create an ssh key pair (optional)**

    _[TK] This step will likely be required in order to remote into your Tableau Server and perform administrative tasks._

3. **Store secrets securely into AWS**

    * Login to AWS and navigate to the "Secrets Manager" service.
    * *Important:* ensure you are logging into the AWS region you selected in the step above. (Secrets are regionalized by AWS.)
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

## Installation

_**TK - add instructions to download the terraform IAC modules.**_

1. Customize the installation by editing `infra/settings.yml` to match your desired setup.

1. Create the infrastructure using [terraform](https://terraform.io).

    ```bash
    cd infra
    terraform init
    terraform apply -auto-approve
    ```


1. Launch an Tableau Server EC2 instance using the following settings:

    ```yaml
    TK - confirm these EC2 settings
    instance_type:  m5.xlarge
    OS:             Windows
    ```

## Config and Test

TK - Instructions on configuring and testing the Tableau Server
