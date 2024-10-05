#!/usr/bin/env bash
# This script backs up the "scripts" folder on the laptop
# Generally the repo is cloned under ~/Documents/GitRepos and 
# symlink is made to the ~/scripts folder
# This script also keep a backup copy of current crontab list
# in the crontab.bak folder

# initially this script was run 1st of every month at midnight
# now, it is being run every Tuesday at 10:20am

debug=1
BASEFOLDER="/Users/kopardevn/Documents/GitRepos/configscriptsetc"
MACHINENAME="NCI-02279157-ML"

set -exo pipefail

# get date
dt=$(date +"%D"|sed "s@/@@g")

# Backup crontab
if [[ "$debug" == "1" ]];then 
echo "Backing up crontab"
fi
crontab -l > ${BASEFOLDER}/${MACHINENAME}/scripts/cronjob_scripts/crontab.bak/crontab.bak.$dt
# you can load from this backup with
# crontab /Users/kopardevn/scripts/cronjob_scripts/crontab.bak

# Backup conda envs
if [[ "$debug" == "1" ]];then 
echo "Backing up conda envs"
fi
cd $BASEFOLDER/$MACHINENAME
./backup_conda_envs.sh

# copy configurations
if [[ "$debug" == "1" ]];then 
echo "Copying configurations"
fi
cp ~/.exrc .
cp ~/.vmrc .
cp ~/.gitconfig .
cp ~/.zshrc .
cp ~/.zshrc_kopardevn .


# Push changes to github
if [[ "$debug" == "1" ]];then 
echo "Pushing changes to github"
fi
cd $BASEFOLDER
git add .
git commit -m "push on $dt"
git push
