#!/bin/bash

# based off of https://github.com/kopardev/activitygenerator
# cd to clone location
cd ~/Desktop/GitRepos/activitygenerator
# run script to generate random string in file "random_uuid.txt"
bash create_random_uuid.sh
# commit the new file to github
x=$(cat random_uuid.txt )
git add .
git commit -m "$x"
git push
