# [Docs](../README.md) > [Labs](./index.md) > **Intro to DevOps Lab**

_Learn GitHub and CI/CD by directly updating this website._

`A Slalom DataOps Lab`

> _**WARNING: Lab Still Under Construction**_

**Table of Contents:**

1. [Install Prereqs](#install-prereqs)
   1. [Overview](#overview)
   2. [How-To](#how-to)
2. [Fork your own personal copy of the repo](#fork-your-own-personal-copy-of-the-repo)
3. [Clone your repo and open it in VS Code](#clone-your-repo-and-open-it-in-vs-code)
4. [Create a new branch](#create-a-new-branch)
5. [Make some changes](#make-some-changes)
6. [Commit your changes](#commit-your-changes)
7. [Create a new Pull Request (PR)](#create-a-new-pull-request-pr)
8. [Wait for your PR to be approved](#wait-for-your-pr-to-be-approved)

## Install Prereqs

### Overview

To complete this lab, you will at least need the following components installed on your local machine:

- VS Code
- Git
- GitHub Desktop

_TIP: If you have not yet installed these, please visit the [DevOps QuickStart page](../setup.html) for automated installation instructions._

### How-To

1. To install these on your local workstation, follow the instructions located at the following links:

- Mac OSX: [docs.dataops.tk/brew](https://docs.dataops.tk/brew)
- Windows: [docs.dataops.tk/choco](https://docs.dataops.tk/choco)

## Fork your own personal copy of the repo

**Understanding Forks and Pull Requests:**

- **Forks** - A "fork" of a repo is a full and complete copy of the upstream code, which we can then safely update without affecting the original. The original upstream repo, called the "upstream" for short, will not be affected by any of our changes in the fork. We do not require any special permissions on a repo in order to fork it.
- **Pull Requests** - Once we are done with our changes we can optionally send a Pull Request to the upstream repo, requesting the owners to "pull" our changes into their repo.

**Creating a personal fork:**

1. In a new browser tab, navigate to the GitHub repository: [https://github.com/slalom-ggp/dataops-docs](https://github.com/slalom-ggp/dataops-docs).
2. At the top-right of the page, click "Fork".
   - _If asked where to create the new fork, select your GitHub to create your own personal copy._

## Clone your forked repo and open it in VS Code

1. Navigate to your new personal fork (`https://github.com/<your-username>/dataops-docs`) in GitHub and select `Clone or Download` > `Open in Desktop`.
   - _**Do not** select `Download Zip`, as this will not register your repo properly with git._
2. Follow the wizard to clone the repo to your local machine. If this is the first time you've used GitHub Desktop, you might want to override the default clone location.
   - Recommended source code root location on Windows is `c:\Source`.
3. Open your newly cloned `dataops-docs` folder in VS Code. You should see an `Open in VS Code` option in **GitHub Desktop**, but if not, you can also open **VS Code** directly and select `Open Folder`.
4. The first time you open the repo, VS Code should prompt you to install recommended plugins. Review the recommendations and then install each one. These add recommended functionality to VS Code for this project, each developer has similar user interface and similar development experience.
5. To test the markdown preview feature, open any file ending in `.md` and look on the right hand side for the preview window. If you don't see a preview, click the magnifying glass at the top right of the file pane.

## Create a new branch

1. Within VS Code, press `ctl+shift+p` (Windows) or `cmd+shift+p` (Mac) to open the command pallete. This gives you a long list of available commands, with recommended and recently-used commands at top of the list.
2. In the command prompt, type 'create branch' and select the `Git: create branch...` option.
3. Give your branch a name, for example `janesmith-cool-new-updates`.

## Now... Make some changes!

_You are ready to make your own changes to the code of this website. Go ahead and make changes to any files you want. Remember to save them and use the preview feature to see if the result looks like you expected. When you are done, go ahead to the next step._

> Tip: The vast majority of software documentation runs on 'markdown' - which is a lightweight, easy-to-read way to add formatting to plain text. If you aren't familiar with Markdown, there's a quick 2-minute tutorial [here](TK).

### What will you change?

Will you engage your creativity, share your favorite app, or fix something that bugged you? The choice is yours! To complete this lab, make any change at all that makes this site better. No change is too small: add a single line, fix a single typo, or update an out of place character - these are all fantastic additions.

_Here are some options of changes you can submit:_

#### Option 1. Add your favorite software packages _(Recommended!)_

Everyone has a favorite app! What could you add to the package lists on the [Mac](../mac_development.md) or [Windows](../windows_development.md) QuickStart pages to make them even more awesome for the next round of students?

#### Option 2. Add your own username to the list of lab graduates

Optionally, either in addition to or in place of other updates, why not add your GitHub username to the [cicd-graduates](cicd-graduates.md) page?! A small piece of immortality in exchange for only a few minutes' effort...

#### Option 3. Make this lab better!

Everything on docs.dataops.tk is auto-published from this repo. How about submitting...

1. Typo corrections or other fixes.
2. Complicated explanations which you can make simpler.
3. Missing explanations that you can provide.

#### Option 4. Add or modify any content on [docs.dataops.tk](https://docs.dataops.tk)

Everything on docs.dataops.tk is auto-published from this repo. How about submitting...

1. New or updated content.
2. Links to to external sites.
3. Cooler graphics or gifs?

## Extra Credit

**Want to see a CI/CD test fail?**

As an experiment, try committing a change with the text `[TK]` anywhere on a markdown page. The text "[TK](https://en.wikipedia.org/wiki/To_come_(publishing))" is short for "to come" in the publishing world, and it serves like a "TODO" marker to signal that your page is not yet ready to publish.

If the CI/CD engine finds this text anywhere in your change, it will fail tests and prevent your code from being merged. The same type of CI/CD failure would occur if you try to include a broken URL or a bad web link.

*Just don't forget to remove the "`TK`" text afterwards so your PR does not stay blocked!*

## Commit your changes

1. Press `Ctrl+Shift+G` to move to the source control view in the left hand pane.
2. In the 'Message' box, provide a short description and then click the check icon to commit your change.
3. Finally, push your branch containing the new changes to git using the `Push` option in the drop-down menu.

## Create a new Pull Request (PR)

A pull request tells the repo maintainers that you are ready for them to review your proposed changes.

> TIP: The name "pull request" comes from the fact that we often do not have permissions to "push" code to a production site. Instead, we send the maintainers of the repo a request that they "pull" our changes into their main branch. The pull request ("PR" for short) will only be merged into production if the maintainers decide to accept our changes and merge our changes into the main branch. The process of merging in our code is fully automated - the maintainers simply need to click on a button in GitHub to approve and merge the PR changes.

1. Return to the browser window and navigate to: [github.com/slalom-ggp/dataops-docs/pulls](https://github.com/slalom-ggp/dataops-docs/pulls)
2. Select "New Pull Request" and follow the prompts to submit your proposed changes in a new PR.
3. Find the 'Checks' tab and confirm that all your tests have completed successfully. If needed, return to VS Code and push a new commit to fix any issues.

## Wait for your PR to be approved (and merged!)

Once your PR is approved, the code will be automatically merged into master and released into the production website.
