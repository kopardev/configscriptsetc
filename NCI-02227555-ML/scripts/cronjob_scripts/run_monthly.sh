#!/usr/bin/env bash
# This script backs up the "scripts" folder on the laptop
# Generally the repo is cloned under ~/Documents/GitRepos and 
# symlink is made to the ~/scripts folder
# This script also keep a backup copy of current crontab list
# in the crontab.bak folder

BASEFOLDER="/Users/kopardevn/Documents/GitRepos/configscriptsetc"
MACHINENAME="NCI-02227555-ML"

set -exo pipefail

# get date
dt=$(date +"%D"|sed "s@/@@g")

# Backup crontab
crontab -l > ${BASEFOLDER}/${MACHINENAME}/scripts/cronjob_scripts/crontab.bak/crontab.bak.$dt
# you can load from this backup with
# crontab /Users/kopardevn/scripts/cronjob_scripts/crontab.bak


# Push changes to github
cd $BASEFOLDER
git add .
git commit -m "push on $dt"
git push
