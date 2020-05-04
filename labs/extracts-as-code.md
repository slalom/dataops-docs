# [Docs](../README.md) > [Labs](./index.md) > **Extracts-as-Code - Populate the data Lake with an open source pipeline**

`A Slalom DataOps Lab`

> _**WARNING: Lab Still Under Construction**_

## Step 1: Configure Extracts

- [ ] Copy Pardot credentials file (`tap-pardot-config.json`) to the `data/taps/.secrets` folder (15s)
- [ ] Open `data/taps/data.select`, delete Salesforce refs, update rules to include all columns on Pardot `accounts` and `opportunities` (45s)
- [ ] Install dataops tools: `pip3 install slalom.dataops` (15s)
- [ ] Run `s-tap plan pardot` to update Pardot extract plan (15s)
- [ ] Review the updated plan file (30s)

## Step 2: Run a Sync Test

- [ ] Switch to `git` tab, browse through all changes (30s)
- [ ] Copy-paste and run the provided `AWS User Switch` command so aws-cli can locate our credentials (15s)
- [ ] Copy-paste and run the provided `Sync command` to execute the Pardot sync in ECS (60s)
- [ ] Click on the provided `Logging URL` link to open Cloudwatch logs in a browser (15s)
- [ ] Wait for the ECS task to start (1-2m)
- [ ] Stop the timer once rows are extracted _**(DONE!)**_

## See Also

- [Original Lab Text](https://github.com/slalom-ggp/dataops-infra/issues/86)
