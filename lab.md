# Intro to DataOps Lab

_This lab will walk you through the process of implementing a new DataOps project._

- [Install Prereqs](#install-prereqs)
  - [Overview](#overview)
  - [How-To](#how-to)
- [Clone this repo and open in VS Code](#clone-this-repo-and-open-in-vs-code)
- [Create a new branch](#create-a-new-branch)
- [Make some changes](#make-some-changes)
- [Commit your changes](#commit-your-changes)
- [Create a new Pull Request (PR)](#create-a-new-pull-request-pr)
- [Wait for your PR to be approved](#wait-for-your-pr-to-be-approved)

## Install Prereqs

### Overview

To complete this lab, you will at least need the following components installed on your local machine:

- VS Code
- Git
- GitHub Desktop

The following are also recommended but not required:

- Docker
- WSL (For Windows Users)
- Terraform

### How-To

1. To install these on your local workstation, follow the instructions located at the following links:

- Mac OSX: https://docs.dataops.tk/brew
- Windows: https://docs.dataops.tk/choco

## Clone this repo and open in VS Code

1. Navigate to [github.com/slalom-ggp/dataops-docs](https://github.com/slalom-ggp/dataops-docs) and select `Clone or Download` > `Open in Desktop`.
2. Follow the wizard to clone the repo to your local machine. If this is the first time you've used GitHub Desktop, you might want to override the default clone location. (Creating a new folder named `Source` is generally a good idea, e.g. `c:\Source` or `c:\Files\Source`)
3. Open the newly cloned `dataops-docs` folder in VS Code. If you don't see an `Open in VS Code` option in GitHub Desktop, you can launch VS Code directly and select `Open Folder`.
4. The first time you open the repo, VS Code should prompt you to install recommended plugins. Review the recommendations and then install each one. These add recommended functionality to VS Code for this project, each developer has similar user interface and similar development experience.
5. To test the markdown preview feature, open any file ending in `.md` and look on the right hand side for the preview window. If you don't see a preview, click the magnifying glass at the top right of the file pane.

## Create a new branch

1. Press `ctl+shift+p` (Windows) or `cmd+shift+p` (Mac) to open the command pallete. This gives you a long list of available commands, with recommended and recently-used commands at top of the list.
2. In the command prompt, type 'create branch' and select the `Git: create branch...` option.
3. Give your branch a name (e.g. `feat/myname-update`)

## Make some changes

_Now you are ready to make your own changes. Go ahead and make changes to any files. Remember to save them and use the preview feature to see if the result looks like you expected. When you are done, go ahead to the next step._

## Commit your changes

1. Press `Ctrl+Shift+G` to move to the source control view in the left hand pane.
2. In the 'Message' box, provide a short description and then click the check icon to commit your change.
3. Finally, push your branch containing the new changes to git using the `Push` option in the drop-down menu.

## Create a new Pull Request (PR)

A pull request tells the repo maintainers that you are ready for them to review your proposed changes.

1. Return to the browser window and navigate to: [github.com/slalom-ggp/dataops-docs/pulls](https://github.com/slalom-ggp/dataops-docs/pulls)
2. Select "New Pull Request" and follow the prompts to submit your proposed changes in a new PR.
3. Find the 'Checks' tab and confirm that all your tests have compelted successfully. If needed, return to VS Code and push a new commit to fix any issues.

## Wait for your PR to be approved

