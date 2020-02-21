# Windows Development QuickStart

<!-- markdownlint-disable MD033 - no-inline-html -->

<a href="chocolatey.org"><img src="https://chocolatey.org/content/images/logo_square.svg" alt="drawing" width="100" style="float: right"/></a>

_These scripts leverage Chocolatey, the package manager for windows. [Click here](https://chocolatey.org/why-chocolatey) to learn more about Chocolatey._

<!-- markdownlint-capture -->
<!-- markdownlint-disable -->
<!-- markdownlint-restore -->

## Installing Chocolatey and Core Tools

_**NOTE:**_

- _You can alternatively click any of the URLs below to download and run the automated setup:_
  - [https://docs.dataops.tk/choco_min.bat](choco_min.bat) - Installs the bare-minimum set of tools to get started: `Chocolatey`, `python`, and `git`
  - [https://docs.dataops.tk/choco_devops.bat](choco_devops.bat) - Installs the above, plus additional development tools: `vscode`, `terraform`, and `docker`

1. Open "cmd.exe" as an adminstrator.
2. Paste and run the [Chocolatey.org](https://chocolatey.org/docs/installation#install-with-cmdexe) install script:

    ```cmd
    @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
    ```

    <a href="https://git-scm.com/"><img src="https://git-scm.com/images/logo@2x.png" alt="drawing" width="45" style="float: right"/></a>

3. Install git.

    ```cmd
    choco install -y git.install --params "/GitOnlyOnPath /SChannel /NoAutoCrlf /WindowsTerminal"
    ```

4. Install core tools:

    ```cmd
    choco install -y choco-protocol-support chocolateygui docker-desktop python3 sudo terraform vscode
    ```

- **NOTE:** See the [Troubleshooting](#troubleshooting) tips below if you run into any difficulties during this process.

## Installing additional tools

Click to install any of the below that would be useful for your project, or find additional packages at [chocolatey.org/packages](https://chocolatey.org/packages).

- [choco://7zip](choco://7zip)
- [choco://anaconda3](choco://anaconda3) or [choco://miniconda](choco://miniconda)
- [choco://awscli](choco://awscli)
- [choco://azure-cli](choco://azure-cli)
- [choco://dbeaver](choco://dbeaver)
- [choco://firefox](choco://firefox)
- [choco://filezilla](choco://filezilla)
- [choco://github-desktop](choco://github-desktop)
- [choco://GoogleChrome](choco://GoogleChrome)
- [choco://gradle](choco://gradle)
- [choco://microsoft-teams.install](choco://microsoft-teams.install)
- [choco://microsoftazurestorageexplorer](choco://microsoftazurestorageexplorer)
- [choco://powerbi](choco://powerbi)
- [choco://r.project](choco://r.project)
- [choco://sql-server-management-studio](choco://sql-server-management-studio)
- [choco://wsl](choco://wsl)
- [choco://wsl-ubuntu-1804](choco://wsl-ubuntu-1804)

## Troubleshooting

If you run into issues during this process, here are some tips which might help:

1. If the batch script approach does not appear to be working, it may be caused by security protections. Try the manual approach of copy-pasting the needed install command, and also make sure you are running the command prompt "as administrator".
2. If the manual approach still does not work, try again to copy-paste the command [from here](https://chocolatey.org/docs/installation#install-with-cmdexe) on the Chocolatey.org website. _(The install command does not change often, but very occasionally there are security patches which require small adjustments to that process.)_
3. If all else fails or if you find a bug in this documentation, please [click here to report the issue as a bug](https://github.com/slalom-ggp/dataops-docs/issues/new). So that we can provide the fastest response possible, please be sure to paste your error message and any other symptoms which may help in the debugging process.

## Related Links

- [Mac Development](mac_development.md)
