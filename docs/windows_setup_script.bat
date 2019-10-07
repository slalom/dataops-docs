echo on

REM Installing Chocolatey - "The package manager for Windows"...
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
REM Chocolatey install complete.

REM Performing choco software installs...

REM Windows feature installs
choco install -y --source windowsfeatures ^
    Microsoft-Windows-Subsystem-Linux ^
    Microsoft-Hyper-V-All

REM Restart may be required at this point. Attempting to continue anyway without restarting...
REM If you experience problems, simply restart your machine and then rerun this script.

REM Software installs
choco install -y ^
    7zip ^
    azure-cli ^
    chocolateygui ^
    docker-desktop ^
    microsoftazurestorageexplorer ^
    powerbi ^
    python3 ^
    r-project ^
    sql-server-management-studio ^
    terraform ^
    vscode ^
    wsl-ubuntu-1804
REM Custom Git Install
choco install -y ^
    git.install --params "/GitOnlyOnPath /SChannel /NoAutoCrlf /WindowsTerminal"

REM Python packages
python -m pip install -y ^
    awscli ^
    pylama ^
    pytest ^
    pytest-cov ^
    nose ^
    s3fs

REM Installs complete. If this is your first time installing, a manual restart is required at this point.
REM If you experience any problems after restarting, you can always rerun this script.

pause
