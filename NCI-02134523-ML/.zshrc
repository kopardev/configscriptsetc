# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/kopardevn/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#add miniconda3
. "/Users/kopardevn/miniconda3/etc/profile.d/conda.sh"

#add aliases
alias subl="/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text"
alias Typora="/Applications/Typora.app/Contents/MacOS/Typora"
alias la="ls -alrth"


#mycd
function mycd()
{
    #if this directory is writable then write to directory-based history file
    #otherwise write history in the usual home-based history file
    tmpDir=$PWD
    echo "#"`date '+%Y-%m-%d %H:%M:%S'` >> $HISTFILE
    echo $USER' has exited '$PWD' for '$@ >> $HISTFILE
    builtin cd "$@" # do actual cd
    if [ -w $PWD ]; then export HISTFILE="$PWD/.kopardevn_dir_bash_history"; touch $HISTFILE; chmod 777 $HISTFILE;
    else export HISTFILE="$HOME/.bash_history";
    fi
    echo "#"`date '+%Y-%m-%d %H:%M:%S'` >> $HISTFILE
    echo $USER' has entered '$PWD' from '$OLDPWD >> $HISTFILE

}
alias cd="mycd"
#initial shell opened
export HISTFILE="$PWD/.kopardevn_dir_bash_history"
#timestamp all history entries
export HISTTIMEFORMAT="%h/%d - %H:%M:%S "
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=1000000
export HISTFILESIZE=1000000
setopt -o histappend ## append, no clearouts
setopt -o histverify ## edit a recalled history line before executing
#setopt -o histreedit ## reedit a history substitution line if it failed

## Save the history after each command finishes
## (and keep any existing PROMPT_COMMAND settings)
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

alias la="ls -alrth"
alias rm="rm -iv"
#alias b="ssh -Y biowulf.nih.gov"
alias b="ssh -Y 128.231.2.9"
alias m="ssh moab.ncifcrf.gov"
#alias h="ssh -Y helix.nih.gov"
alias h="ssh -Y 128.231.2.3"
#alias batch="ssh -Y batch.ncifcrf.gov"
alias batch="ssh -Y 10.156.101.10"
#alias globus="ssh -Y ncias-p1462.nci.nih.gov"
alias globus="ssh -Y ncias-p2237.nci.nih.gov"
alias nas="ssh -oHostKeyAlgorithms=+ssh-dss root@192.168.1.42"
alias sublime="/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2"
alias usage='du -sk * 2> >(grep -v "Permission denied")| sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'


export PATH=$PATH:/Users/kopardevn/bin/ucsc
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/openblas/lib"
export CPPFLAGS="-I/usr/local/opt/openblas/include"
#export PKG_CONFIG_PATH="/usr/local/opt/openblas/lib/pkgconfig"
export LDFLAGS="$LDFLAGS -L/usr/local/opt/readline/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/readline/include"
#export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
export LDFLAGS="$LDFLAGS -L/usr/local/opt/openblas/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/openblas/include"
#export PKG_CONFIG_PATH="/usr/local/opt/openblas/lib/pkgconfig"
export LDFLAGS="$LDFLAGS -L/usr/local/opt/readline/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/readline/include"
#export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
export LDFLAGS="$LDFLAGS -L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/tcl-tk/include"

#setting up javafx and then TappAS
export PATH_TO_FX="/Users/kopardevn/javafx/javafx-sdk-11.0.2/lib"
alias javafxc="javac --module-path ${PATH_TO_FX} --add-modules=javafx.controls,javafx.fxml,javafx.media,javafx.web,javafx.swing,javafx.graphics,javafx.base"
alias javafx="java --module-path ${PATH_TO_FX} --add-modules=javafx.controls,javafx.fxml,javafx.media,javafx.web,javafx.swing,javafx.graphics,javafx.base"
alias tappas="javafx -jar ~/bin/tappAS-1.0.5/tappas.jar"

# github 
# omnitoken
# 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
export PAT="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"
