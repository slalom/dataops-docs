# [Docs](../README.md) > [Setup](../setup/index.html) > Mac OSX Development QuickStart

<!-- markdownlint-disable MD033 - no-inline-html -->

<a href="https://brew.sh"><img src="https://brew.sh/assets/img/linuxbrew.png" alt="drawing" width="100" style="float: right"/></a>

_These scripts leverage Homebrew, the package manager for Mac. [Click here](https://brew.sh) to learn more about Homebrew._

<!-- markdownlint-capture -->
<!-- markdownlint-disable -->
<!-- markdownlint-restore -->

## Installing Homebrew and Core Tools

1. Open "Terminal".
2. Paste and run the [Homebrew](https://brew.sh) install script:

    ```bash
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```

    <a href="https://git-scm.com/"><img src="https://git-scm.com/images/logo@2x.png" alt="drawing" width="45" style="float: right"/></a>

3. Install git.

    ```cmd
    brew install git
    ```

4. Install core tools:

    ```cmd
    brew install cask docker python3 terraform
    brew cask install cakebrew visual-studio-code
    ```

## Installing additional tools

After following the instructions from the above, you should now have the **Cakebrew** app installed, which gives a friendly GUI on top of the Homebrew installer.

To install any additional programs, either open the **Cakebrew** app or copy-paste the below samples into a Terminal window. (You can also find additional packages at [https://brew.sh](https://brew.sh).)

- `brew install awscli`
- `brew install azure-cli`
- `brew install elasticsearch`
- `brew install gradle`
- `brew cask install anaconda`
- `brew cask install dbeaver-community`
- `brew cask install github`
- `brew cask install google-chrome`
- `brew cask install microsoft-teams`
- `brew cask install r`
- `brew cask install slack`

## Extra Credit: Create a GitHub Account

For extra credit, visit [GitHub.com](https://github.com/) and register a new account. Once you've created a GitHub account and installed the core software, you are all all set to contribute to open source projects in GitHub, including this one!

- _Tip: Rather than create multiple accounts, we recommend using a single GitHub account for both work and personal development projects._

## Related Links

- [Windows Setup QuickStart](windows.md)
- Brew QuickSetup Script: [https://docs.dataops.tk/setup/brew_install.sh](setup/brew_install.sh) ([source](https://github.com/slalom-ggp/dataops-docs/blob/master/setup/brew_install.sh))
