#!/usr/bin/env bash

# based off of https://github.com/kopardev/activitygenerator
if [ "$(uname)" == "Darwin" ];then
rl="/usr/local/bin/greadlink"
elif [ "$(uname)" == "Linux" ];then
rl="/usr/bin/readlink"
fi


# cd to clone location
clone_dir="/Users/kopardevn/Documents/GitRepos/activitygenerator"
cd $clone_dir
# run script to generate random string in file "random_uuid.txt"
/bin/bash create_random_uuid.sh
# commit the new file to github
x=$(/bin/cat random_uuid.txt )
/usr/bin/git add .
/usr/bin/git commit -m "$x"
/usr/bin/git push
