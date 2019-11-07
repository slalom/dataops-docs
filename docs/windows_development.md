# Windows Development QuickStart

**Note:** these scripts require admin rights in order to install the needed software.

_The walthrough option below will walk you through the install process one step at a time. Use this option if you want to observe the process or have more control over which tools are installed._

These scripts leverage [Chocolatey](https://chocolatey.org), the package manager for windows. To install Chocolatey:

## Step 1: Install the Installer and Core Tools

* _**NOTE:** You can download and run [windows_setup_script.bat](windows_setup_script.bat) to complete this step automatically._

1. Open "cmd.exe" an adminstrator.
2. Paste and run [the install script](https://chocolatey.org/docs/installation#install-with-cmdexe):

    ```cmd
    @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
    ```

3. Install git.

    ```cmd
    choco install -y git.install --params "/GitOnlyOnPath /SChannel /NoAutoCrlf /WindowsTerminal"
    ```

4. Install core tools:

    ```cmd
    choco install -y choco-protocol-support chocolateygui docker-desktop python3 sudo terraform vscode
    ```

## Step 2: Install additional tools

Click to install any of the below that would be useful for your project, or find additional packages at [chocolatey.org/packages](https://chocolatey.org/packages).

* [choco://7zip](choco://7zip)
* [choco://anaconda3](choco://anaconda3) or [choco://miniconda](choco://miniconda)
* [choco://awscli](choco://awscli)
* [choco://azure-cli](choco://azure-cli)
* [choco://dbeaver](choco://dbeaver)
* [choco://filezilla](choco://filezilla)
* [choco://github-desktop](choco://github-desktop)
* [choco://GoogleChrome](choco://GoogleChrome)
* [choco://microsoft-teams.install](choco://microsoft-teams.install)
* [choco://microsoftazurestorageexplorer](choco://microsoftazurestorageexplorer)
* [choco://powerbi](choco://powerbi)
* [choco://r.project](choco://r.project)
* [choco://sql-server-management-studio](choco://sql-server-management-studio)
* [choco://wsl](choco://wsl)
* [choco://wsl-ubuntu-1804](choco://wsl-ubuntu-1804)
