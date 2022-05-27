#!/usr/bin/env bash

set -exo pipefail

# get date
dt=$(date +"%D"|sed "s@/@@g")

# Backup crontab
crontab -l > /Users/kopardevn/scripts/cronjob_scripts/crontab.bak
# you can load from this backup with
# crontab /Users/kopardevn/scripts/cronjob_scripts/crontab.bak


# Push changes to github
cd /Users/kopardevn/scripts/
git add .
git commit -m "monthly push on $dt"
git push
