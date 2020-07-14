FROM mcr.microsoft.com/windows:1903

# Install chocolatey from chocolately.org
RUN @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

# Install core components
RUN choco install --no-progress -y wsl

# Install Ubuntu 18.04
RUN choco install --no-progress --verbose -y wsl-ubuntu-1804
