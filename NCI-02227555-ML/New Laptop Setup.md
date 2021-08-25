<!-- vscode-markdown-toc -->
* 1. [Generate ssh keys and setup biowulf](#Generatesshkeysandsetupbiowulf)
* 2. [Setup GitHub](#SetupGitHub)
* 3. [Setup zsh](#Setupzsh)
* 4. [Install Typora](#InstallTypora)
* 5. [Install VSCode](#InstallVSCode)
* 6. [Install Java](#InstallJava)
* 7. [Install Other tools](#InstallOthertools)
* 8. [Install other brew tools](#Installotherbrewtools)
* 9. [Restore old files](#Restoreoldfiles)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->


###  1. <a name='Generatesshkeysandsetupbiowulf'></a>Generate ssh keys and setup biowulf

```bash
ssh-keygen -t rsa -b 4096
```

Copy the contents of `id_rsa.pub` file and append to `.ssh/authorized_keys` on biowulf

###  2. <a name='SetupGitHub'></a>Setup GitHub

```bash
git config -l
git config --global user.name "kopardev"
git config --global user.email "vishal.koparde@nih.gov"
git config --global credential.helper cache
```

Next time GH asks for password, copy paste the PAT and it will not ask password until PAT expires. More details [here](https://github.com/CCBR/Tools/tree/master/git#pat-or-personal-access-token).

Copy contents of `id_rsa.pub` from the previous step and setup ssh access to github.com [here](https://github.com/settings/keys). Verify access by running:

```bash
ssh -T git@github.com
```

###  3. <a name='Setupzsh'></a>Setup zsh

```bash
#!/bin/bash
# MAC OSX defaults to zsh now from bash

# set zsh as default shell
chsh -s $(which zsh)

# install oh-my-zsh
if [ -f ~/.zshrc ]; then
mv ~/.zshrc ~/.zshrc.original
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install zsh-completions
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# add "source ~/.zshrc_kopardevn" to the bottom of ~/.zshrc file
echo "source ~/.zshrc_kopardevn" >> ~/.zshrc

# Now add customizations to ~/.zshrc_kopardevn
```

Set the theme in `~/.zshrc`

```bash
ZSH_THEME="powerlevel9k/powerlevel9k"
```

Download and install iterm2 and then set the font to Menlo from Powerline with the following settings:

![image-20210817120241168](https://i.loli.net/2021/08/18/Fcv3VqEsGgaykI7.png)

###  4. <a name='InstallTypora'></a>Install Typora

Download and install Typora for editing Markdown files from [here](https://typora.io/). To upload embedded images Typora also requires `uPic`

```bash
brew install upic
```

###  5. <a name='InstallVSCode'></a>Install VSCode

Download and install from [here](https://code.visualstudio.com/download). Then install the following extensions

* [Snakemake](https://github.com/snakemake/snakemake-lang-vscode-plugin)
* [Pylance](https://github.com/microsoft/pylance-release)
* [Remote SSH](https://github.com/Microsoft/vscode-remote-release)
* [TOC](https://github.com/joffreykern/vscode-markdown-toc)

###  6. <a name='InstallJava'></a>Install Java

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/cask-versions
brew update
brew tap homebrew/cask
brew install java
```

###  7. <a name='InstallOthertools'></a>Install Other tools

* [XQuartz](https://www.xquartz.org/) This is required for `ssh -Y` to work correctly. Installation requires restart. Verify installation with `echo $DISPLAY`.
* [Evernote](https://evernote.com/download)
* [Google Chrome](https://www.google.com/chrome/) Then sign in with google account to auto install extensions and download bookmarks.
* [Brave Browser](https://brave.com/download/#mac-options) Then import bookmarks from Google Chrome.
* [IGV](https://software.broadinstitute.org/software/igv/download)
* [R](https://cran.r-project.org/bin/macosx/)
* [Rstudio](https://www.rstudio.com/products/rstudio/download/)
* [Adobe Reader](https://get.adobe.com/reader/) This is required for Digitally signing PDFs with PIV card certificates.

###  8. <a name='Installotherbrewtools'></a>Install other brew tools

```bash
brew install wget
brew install tree
brew install terminal-notifier
brew install coreutils
brew install mkdocs
```

###  9. <a name='Restoreoldfiles'></a>Restore old files

1. Files are backed up to external HDD and can be recovered via rsync
2. Files can be restored using Druva InSync (recommended)
