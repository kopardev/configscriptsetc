#!/bin/bash
# wrapper script to run script with proper logging
# arguments:
# arg1: path of script to run and its arguments

# setting some basics for logging
# scriptname=$(basename `echo $0`)
scriptname=$(basename $2)
dt=$(date +"%D_%T"|sed "s@/@@g"|sed "s@:@@g")
scriptrunlog_bn="${scriptname}.${dt}.log"
# define CRONJOB_LOGDIR in .zshrc or .bashrc
logdir=$CRONJOB_LOGDIR
if [ "$logdir" == "" ];then logdir=$HOME;fi
scriptrunlog="${logdir}/${scriptrunlog_bn}"

echo $scriptrunlog

# run the script
$@ > $scriptrunlog 2>&1
