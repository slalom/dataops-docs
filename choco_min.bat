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

REM NOTE: A restart may be required at this point. Attempting to continue anyway without restarting...
REM       If you experience problems, simply restart your machine and then rerun this script.

REM Custom Git Install
choco install --no-progress -y ^
    git.install --params "/GitOnlyOnPath /SChannel /NoAutoCrlf /WindowsTerminal"

REM Software Installs (DevOps-Required Tools)
choco install --no-progress -y ^
    choco-protocol-support ^
    chocolateygui ^
    python3 ^
    sudo

REM Install script complete. If this is your first time installing, a manual restart is required at this point.
REM If you experience any problems after restarting, you can always rerun this script.

REM Install optional components:
REM     choco://7zip
REM     choco://awscli
REM     choco://azure-cli
REM     choco://dbeaver
REM     choco://docker-desktop
REM     choco://filezilla
REM     choco://github-desktop
REM     choco://microsoft-teams.install
REM     choco://microsoft-windows-terminal  # Requires latest windows updates
REM     choco://microsoftazurestorageexplorer
REM     choco://powerbi
REM     choco://r.project
REM     choco://terraform
REM     choco://vscode
REM     choco://wsl
REM     choco://wsl-ubuntu-1804

pause
