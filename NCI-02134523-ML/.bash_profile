# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kopardevn/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kopardevn/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/kopardevn/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kopardevn/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Log bash history in each folder

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
shopt -s histappend ## append, no clearouts                                                               
shopt -s histverify ## edit a recalled history line before executing                                      
shopt -s histreedit ## reedit a history substitution line if it failed                                    

## Save the history after each command finishes                                                           
## (and keep any existing PROMPT_COMMAND settings)                                                        
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#ALIASES
alias la="ls -alrth"
alias rm="rm -iv"
#alias b="ssh -Y biowulf.nih.gov"
alias batch="ssh -Y batch.ncifcrf.gov"
alias b="ssh -Y 128.231.2.9"
alias m="ssh moab.ncifcrf.gov"
#alias h="ssh -Y helix.nih.gov"
alias h="ssh -Y 128.231.2.3"
#alias globus="ssh -Y ncias-p1462.nci.nih.gov"
alias globus="ssh -Y ncias-p2237.nci.nih.gov"
alias nas="ssh -oHostKeyAlgorithms=+ssh-dss root@192.168.1.42"
alias sublime="/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2"
alias usage='du -sk * 2> >(grep -v "Permission denied")| sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

#PATH
export PATH=$PATH:/Users/kopardevn/bin
#export PATH=$PATH:/Library/TeX/texbin

#APPEARANCE
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
#PS1="\u@\h \w> "
GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"

#export PS1="${GREEN}\u@\h \w${RESET}> "

export PS1="\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;31m\]\w\[\033[00m\]\$ "
#export PATH="/usr/local/opt/e2fsprogs/bin:$PATH"
#export PATH="/usr/local/opt/e2fsprogs/sbin:$PATH"

#perl stuff
#PATH="/Users/kopardevn/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/Users/kopardevn/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/Users/kopardevn/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/Users/kopardevn/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/Users/kopardevn/perl5"; export PERL_MM_OPT;

#add ucsc
#export PATH=$PATH:/Users/kopardevn/bin/ucsc
#export PATH=$PATH:/Users/kopardevn/bin/ucsc/blat

#print details
echo " "
date "+%A %d %B %Y, %T"
df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'
echo " "
