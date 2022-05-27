#!/usr/bin/env bash

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
git commit -m "monthly push on $dt"
git push
