# [Docs](../README.md) > [Labs](./index.md) > **IAC Intro - Deploying a Data Lake on AWS**

`A Slalom DataOps Lab`

> _**WARNING: Lab Still Under Construction**_

## Lab Objectives

- Create a new repository from a sample template repo which already exists.
- Clone and open the new repository on your local workstation.
- Customize the infrastructure and add credentials as needed.
- Use `terraform apply` to deploy the data lake data lake, the VPC, and public/private subnets

## Setup

- one-time setup:
  - Installed software:
    - `choco install vscode python3 docker awscli github-desktop`
    - `choco install git.install --params "/GitOnlyOnPath /SChannel /NoAutoCrlf /WindowsTerminal"`
- environment setup (each time):
  - Open browser tabs:
    - the lab checklist (this page)
    - [linux academy](https://app.linuxacademy.com/dashboard)
    - [slalom-ggp/dataops-project-template](https://github.com/slalom-ggp/dataops-project-template)

## Lab Steps

### Step 1: Create Repo and AWS Account

- [ ] Create new repo from the [Slalom DataOps Template](https://github.com/slalom-ggp/dataops-project-template), clone repo locally and open in VS Code (60s)
- [ ] Get AWS credentials from Linux Academy (30s)
- [ ] Use the linux-academy link to log in to AWS in the web browser (30s)

### Step 2: Configure Creds

- [ ] In the `.secrets` folder, rename `credentials.template` to `.secrets/credentials`, copy-paste credentials into file (30s)
- [ ] In the `.secrets` folder, rename `aws-secrets-manager-secrets.yml.template` to `aws-secrets-manager-secrets.yml` (no addl. secrets needed in this exercise) (30s)

### Step 3: Configure Project

- [ ] Rename `infra-config-template.yml` to `infra-config.yml` - update email address and project shortname (30s)

### Step 4: Configure and Deploy Terraform

- [ ] Open the `infra` folder, review each file (90s)
  - [ ] Delete the `data-build-tool.tf` file and the `singer-taps.tf` file.
- [ ] Run `terraform init` and `terraform apply`, type 'yes' (30s)
- [ ] Wait for `terraform apply` to complete (2m)
  - [ ] Switch to the `git` tab, review code changes while apply is running

### Step 5: Confirm resource creation

- [ ] Copy-paste and run the provided `AWS User Switch` command so aws-cli can locate our AWS credentials (30s)
- [ ] Upload infra-config.yml to the data bucket: `aws s3 cp ../infra-config.yml s3://...` (30s)
- [ ] List the bucket contents with `aws s3 ls s3://...` (30s)
- [ ] In the web browser, browse to the bucket and confirm the file has landed. (30s)
- [ ] Stop the time once the transfer is successfully confirmed. _**(DONE!)**_

## See Also

- [Original Lab Text](https://github.com/slalom-ggp/dataops-infra/issues/85)
