echo "Checking if script already has admin rights..."
NET SESSION
IF %ERRORLEVEL% NEQ 0 GOTO ELEVATE
GOTO ADMIN

:ELEVATE
echo "Attempting to obtain admin rights..."
CD /d %~dp0
MSHTA "javascript: var shell = new ActiveXObject('shell.application'); shell.ShellExecute('%~nx0', '', '', 'runas', 1);close();"
EXIT

:ADMIN
echo "Continuing script (with admin rights)..."
echo on

REM Installing Chocolatey - "The package manager for Windows"...
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
REM Chocolatey install complete.

REM Installing needed Windows features....
choco install -y --no-progress --source windowsfeatures ^
    Microsoft-Hyper-V

REM NOTE: A restart may be required at this point. Attempting to continue anyway without restarting...
REM       If you experience problems, simply restart your machine and then rerun this script.

REM Custom Git Install
choco install --no-progress -y ^
    git.install --params "/GitOnlyOnPath /SChannel /NoAutoCrlf /WindowsTerminal"

REM Software Installs (DevOps-Required Tools)
choco install --no-progress -y ^
    choco-protocol-support ^
    chocolateygui ^
    docker-desktop ^
    python3 ^
    sudo ^
    terraform ^
    vscode

REM Install script complete. If this is your first time installing, a manual restart is required at this point.
REM If you experience any problems after restarting, you can always rerun this script.

REM Install optional components:
REM     choco://7zip
REM     choco://awscli
REM     choco://azure-cli
REM     choco://dbeaver
REM     choco://filezilla
REM     choco://github-desktop
REM     choco://microsoft-teams.install
REM     choco://microsoft-windows-terminal  # Requires latest windows updates
REM     choco://microsoftazurestorageexplorer
REM     choco://powerbi
REM     choco://r.project
REM     choco://wsl
REM     choco://wsl-ubuntu-1804
REM     choco://ditto

pause
