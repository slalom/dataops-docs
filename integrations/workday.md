# [Docs](../README.md) > [Integrations](./README.md) > Workday Data Integration Guide

This guide will explain the various options for securely extracting data from Workday.

## Platform Overview

1. Workday supports two primary methods of data extraction: "Report-as-a-Service" or "RaaS" (recommended) and "Core Integrations". The Core Integrations are more generally more technical and may require additional admin permissions on Workday. RaaS integrations are easy to setup and do not necessarily require admin permissions.
2. To create a RaaS, simply create a report as usual and check the checkbox to enable that report as a RaaS.
3. Workday includes a module called "Enterprise Integration Builder" or "EIB". The EIB tool makes it easy to push data from a RaaS report into one of a small number of integration targets, including: FTP, SFTP, and S3.
4. The Workday EIB tool allows you to easily protect data using PGP encryption before pushing it to the specified target location. The encryption option is configurable by stepping through the EIB wizard, and it applies to all of the EIB options described below.
5. As a general best practice, you may optionally want to change the owner of the Workday report and/or the EIB process to a systems integration account, rather than running under a personal user account.

## Export Options

**_Note:_**

* _EIB is generally preferred over API access, since direct pulls from the API require significant coding effort. Pulling from APIs requires direct permissions into the Workday system._

### Option A - EIB Push to SFTP (Recommended for Azure Environments)

The recommended option for Azure environments is to push data into an SFTP site. Files can optionally be secured with PGP encryption prior to sending.

### Option B - EIB Push to S3 (Recommended for AWS Environments)

The recommended option for AWS environments is to push data into an S3 bucket.This file can optionally be secured with PGP encryption prior to sending.

### Option C - Pull via Workday API

After registering a report as a RaaS endpoint, you can then pull from that report using custom code which connects to the REST or SOAP APIs.

## Additional Info

### Standard Disclaimer

_**Note:** Any "recommended" options are recommended solely by the author and come with no guarantees. If you know a better way, or if you have a suggestion to improve this page, please [create a pull request](/CONTRIBUTING.md)."_

### Additional Links

* [Using Workday RaaS to Extract Data](https://community.snaplogic.com/t/using-workday-raas-to-extract-data/176)
* [AWS Hosted SFTP Service](https://aws.amazon.com/sftp/?whats-new-cards.sort-by=item.additionalFields.postDateTime&whats-new-cards.sort-order=desc)
