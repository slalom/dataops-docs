# Infrastructure Catalog Guide

_**NOTE:** This is an early preview of the D&A Infrastucture catalog. Additional components and capabilities will be released in the coming weeks and months._

## Install prereqs

1. Visit the quickstart for [mac_development](mac_development.md) or [windows_development](windows_development.md) to get your machine setup with python, terraform, and VS Code.
2. Install the Slalom DataOps tools library: `pip install slalom.dataops`

## Getting started from the project template

1. Create a new repo from [`dataops-project-template`](https://github.com/slalom-ggp/dataops-project-template).
2. Add the following environment variable secrets in the new GitHub repo's settings: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
3. Customize the files in the `infra` folder to meet your needs, optionally deleting or disabling any components you don't need.

## Getting started from scratch

1. Create aws prereqs `s-infra install catalog:aws-prereqs --infra_dir=infra/prereqs --deploy=True`
   - You will be prompted to create an AWS account and to enter the associated credentials. These credentials will be saved in the file `~/.aws/credentials`, under a new profile called `terraform`.
2. Install AWS starter samples `s-infra install samples:aws --infra_dir=infra`.
3. Navigate to the `infra` folder and run `terraform apply`.

## Related Links

- **Infra Catalog**: [slalom-ggp/dataops-infra](https://github.com/slalom-ggp/dataops-infra)
- **Template Project**: [slalom-ggp/dataops-project-template](https://github.com/slalom-ggp/dataops-project-template)
