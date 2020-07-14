
# Lab Troubleshooting

1. "Error 400 ... Policy Document Must Contain Resources"
    - This was an interim issue caused by an unneeded (empty) policy being created.
    - In general, you can ignore this error and proceed with the next steps to validate the environment.
    - To resolve the issue, first run `terraform init --upgrade`, then rerun `terraform apply`.
    - If you are using Linux Academy Playground, please also consult the AWS Sandbox troubleshooting tip #3 (below) on how to restart a fresh environment if yours has timed out.
2. "Error 403 ... InvalidClientTokenId"
    - This most often means there's a problem with your AWS credentials file.
    - If the `aws-credentials` file is still open, make sure you use `ctrl+s` to save the file if it is not yet saved.
    - If the above does not resolve the issue, you may need to return to Linux Academy Playground and make sure your AWS Sandbox is still running.
    - As a last check, it is a good idea to double-check that the AWS key pair pasted matches the Linux Academy AWS credentials.
3. Errors after restarting the AWS Sandbox in Linux Academy Playground
    - If you run out of time on your playground account (4 hour limit), you will have to create a new environment.
    - In this case, you will also have to delete the `terraform.tfstate` file - since otherwise terraform will unsuccessfully try to manage objects which no longer exist and which are not accessible from the new AWS account.
    - Warning: in normal environments (aka when not using Linux Academy Playground), you you should not delete the `tfstate` file and instead you can simply run `terraform destroy`.
4. PowerShell (PS) Terminal issues (Windows only)
    - The `AWS User Switch` command is in the syntax of Command Prompt and does not work properly in PowerShell.
    - If you are running in PowerShell, either: (option A) run `cmd` to switch to command prompt before running the commands, or (option B) within PowerShell, replace `SET AWS_SHARED_CREDENTIALS_FILE=...` with `$env:AWS_SHARED_CREDENTIALS_FILE="..."`.
5. Unwanted email notifications due to scheduled CI/CD jobs failing.
    - Earlier versions of this lab had daily jobs scheduled by default, which would fail and send unwanted failure notifications.
    - To disable these notifications, perform any one of the three options below:
      1. Navigate to the folder `.github/workflows` and delete the file `daily_refresh.yml` and then commit and push the change to GitHub.
      2. Navigate to the GitHub repo on GitHub.com, open the "Settings", then under "Actions" select the option to disable all actions in the repo.
      3. Navigate to your personal [GitHub Notification Settings page](https://github.com/settings/notifications) and uncheck "Email" in the "GitHub Actions" section.
6. Error when running ECS Task: `TaskDefinition not found.`
    - This is most likely due to not having run the `AWS Switch Command`. Or it is not running properly.
    - This is normally due to a mismatch between the credentials used for a project and the
      credentials stored on your machine. Try one of the below:
      1. Run `terraform output` and copy-paste-and-run the `AWS User Switch Command` in the Terminal.
      2. If your credentials have expired, please double check that your latest credentials are stored.
      3. If your Linux Academy Playground account has expired, then please delete your `terraform.tfstate` file.
7. Error during `terraform apply`: `The given key does not identify an element in this collection value. ...  )[split(":", location)[1]]`
    - This is most likely due to missing overrides for the Covid-19 secrets (aka credentials).
    - To resolve, double check that you have replaced all instances of `username` and `password` with `api_token` and `user_agent`, respectively, in `02_singer-taps.tf`.
