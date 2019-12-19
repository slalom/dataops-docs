# Mac OSX Development QuickStart

<!-- markdownlint-disable MD033 - no-inline-html -->

<a href="https://brew.sh"><img src="https://brew.sh/assets/img/linuxbrew.png" alt="drawing" width="100" style="float: right"/></a>

_These scripts leverage Homebrew, the package manager for Mac. [Click here](https://homebrew[TK].org/why-homebrew[TK]) to learn more about Homebrew._

<!-- markdownlint-capture -->
<!-- markdownlint-disable -->
<!-- markdownlint-restore -->

## Installing Homebrew and Core Tools

_**NOTE:**_

* _You can alternatively click here ([https://docs.dataops.tk/brew_install.sh](brew_install.sh)) to download and run the automated Homebrew install script._

1. Open "Terminal".
2. Paste and run the [Homebrew](https://brew.sh) install script:

    ```bash
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```

    <a href="https://git-scm.com/"><img src="https://git-scm.com/images/logo@2x.png" alt="drawing" width="45" style="float: right"/></a>

3. Install git.

    ```cmd
    brew install git"
    ```

4. Install core tools:

    ```cmd
    brew install docker python3 terraform
    brew cask install visual-studio-code
    ```

## Installing additional tools

Copy-paste from the below to install any additional programs which would be useful for your project, or find additional packages at [https://brew.sh](https://brew.sh).

* `brew install awscli`
* `brew install azure-cli`
* `brew install zip`
* `brew cask install anaconda`
* `brew cask install dbeaver-community`
* `brew cask install github`
* `brew cask install google-chrome`
* `brew cask install microsoft-teams`
* `brew cask install r`
