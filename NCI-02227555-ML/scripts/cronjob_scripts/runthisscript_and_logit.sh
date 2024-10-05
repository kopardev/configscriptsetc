#!/usr/bin/env bash
# wrapper script to run script with proper logging
# arguments:
# arg1: path of script to run and its arguments

notifier=/opt/homebrew/bin/terminal-notifier
# if notifier is not installed then
# brew install terminal-notifier

# setting some basics for logging
# scriptname=$(basename `echo $0`)
scriptname=$(basename $1)
dt=$(date +"%D_%T"|sed "s@/@@g"|sed "s@:@@g")
scriptrunlog_bn="${scriptname}.${dt}.log"
# define CRONJOB_LOGDIR in .zshrc or .bashrc
# logdir=$CRONJOB_LOGDIR
# if [ "$logdir" == "" ];then logdir=$HOME;fi
logdir="/Users/kopardevn/scripts/cronjob_scripts/logs"
scriptrunlog="${logdir}/${scriptrunlog_bn}"

echo $scriptrunlog

# run the script
$@ > $scriptrunlog 2>&1

now=$(date)
$notifier -title CronJob -subtitle "$now" -message "Job Ran: $scriptname" 
echo "Cron job $scriptname completed at $now"
