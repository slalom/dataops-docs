# Windows Development QuickStart

<!-- markdownlint-disable MD033 - no-inline-html -->

<a href="chocolatey.org"><img src="https://chocolatey.org/content/images/logo_square.svg" alt="drawing" width="100" style="float: right"/></a>

_These scripts leverage Chocolatey, the package manager for windows. [Click here](https://chocolatey.org/why-chocolatey) to learn more about Chocolatey._

<!-- markdownlint-capture -->
<!-- markdownlint-disable -->
<!-- markdownlint-restore -->

## Installing Chocolatey and Core Tools

* _**NOTE:** You can alternatively [click here](windows_setup_script.bat) to download and run the automated setup script, which will execute the below steps automatically._

1. Open "cmd.exe" as an adminstrator.
2. Paste and run the [Chocolatey.org](https://chocolatey.org/docs/installation#install-with-cmdexe) install script:

    ```cmd
    @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
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

## Installing additional tools

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
