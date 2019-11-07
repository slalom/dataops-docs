# Windows Development QuickStart

## Option A: Fully-Automated

For a **fully automated execution**, simply download and run any or all of the below scripts:

- [windows_setup_script.bat](windows_setup_script.bat) _(run this first)_
- [windows_install_wsl.bat](windows_setup_script.bat)

**Note:** these scripts require admin rights in order to install the needed software.

## Option B: Installation Walkthrough

_The manual walthrough option below will walk you through the install process one step at a time. Use this option if you want to observe the process or have more control over which tools are installed._

### Step 1: Install the Installer

These scripts leverage [Chocolatey](https://chocolatey.org), the package manager for windows. To install Chocolatey:

1. Open "cmd.exe" an adminstrator.
2. Paste and run [the install script](https://chocolatey.org/docs/installation#install-with-cmdexe):

    ```cmd
    @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
    ```


### Step 2: Install the Core Tools

The scripts below will install everything you need to get started, including: Git, VS Code, Python, Power BI, Docker, and the AWS and Azure CLIs.

1. Install git.

    ```cmd
    choco install -y ^
        git.install --params "/GitOnlyOnPath /SChannel /NoAutoCrlf /WindowsTerminal"
    ```

2. Install core tools:

    ```cmd
    choco install -y choco-protocol-support chocolateygui docker-desktop python3 sudo terraform vscode
    ```

### Step 3: Install WSL (Windows Subsystem for Linux)

Install WSL to run Linux programs and scripts natively on your windows machine.

```cmd
choco install wsl-ubuntu-1804
```

* One-click install: [choco://wsl-ubuntu-1804](choco://wsl-ubuntu-1804)

### Step 4: Install additional tools

Install any of the below that would be useful for your project, or find additional packages at [chocolatey.org/packages](https://chocolatey.org/packages)

Click on any of these links to install automatically:

- [choco://7zip](choco://7zip)
- [choco://anaconda3](choco://anaconda3) or [choco://miniconda](choco://miniconda)
- [choco://awscli](choco://awscli)
- [choco://azure-cli](choco://azure-cli)
- [choco://dbeaver](choco://dbeaver)
- [choco://filezilla](choco://filezilla)
- [choco://github-desktop](choco://github-desktop)
- [choco://GoogleChrome](choco://GoogleChrome)
- [choco://microsoft-teams.install](choco://microsoft-teams.install)
- [choco://microsoftazurestorageexplorer](choco://microsoftazurestorageexplorer)
- [choco://powerbi](choco://powerbi)
- [choco://r.project](choco://r.project)
- [choco://sql-server-management-studio](choco://sql-server-management-studio)
- [choco://wsl](choco://wsl)
- [choco://wsl-ubuntu-1804](choco://wsl-ubuntu-1804)
