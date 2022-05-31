#!/usr/bin/env bash

# initially this script was run 1st of every month at midnight
# now, it is being run every Tuesday at 10:20am

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
