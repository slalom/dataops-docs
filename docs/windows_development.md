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
    choco install -y ^
        azure-cli ^
        choco-protocol-support ^
        chocolateygui ^
        dbeaver ^
        docker-desktop ^
        powerbi ^
        python3 ^
        terraform ^
        vscode
    python -m pip install ^
        awscli ^
        pylama ^
        pytest ^
        pytest-cov ^
        nose ^
        s3fs
    ```

### Step 3: Install WSL (Windows Subsystem for Linux)

Install WSL to run Linux programs and scripts natively on your windows machine.

```cmd
choco install wsl-ubuntu-1804
```

### Step 4: Find additional tools

Install any of the below that would be useful for your project, or find additional packages at [chocolatey.org/packages](https://chocolatey.org/packages)

```cmd
choco install 7zip
choco install microsoftazurestorageexplorer
choco install r-project
choco install sql-server-management-studio
```

Or after installing the choco protocol `choco install choco-protocol-support`, click on any of these links:

- [choco://7zip](choco://7zip)
- [choco://anaconda3](choco://anaconda3) or [choco://miniconda](choco://miniconda)
- [choco://r-project](choco://r-project)
- [choco://GoogleChrome](choco://GoogleChrome)
- [choco://sql-server-management-studio](choco://sql-server-management-studio)
