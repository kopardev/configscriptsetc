#!/usr/bin/env bash

# based off of https://github.com/kopardev/activitygenerator
if [ "$(uname)" == "Darwin" ];then
rl=$(which greadlink)
elif [ "$(uname)" == "Linux" ];then
rl=$(which readlink)
fi

# cd to clone location
cd $(dirname $($rl -f $(basename $0)))
# run script to generate random string in file "random_uuid.txt"
bash create_random_uuid.sh
# commit the new file to github
x=$(cat random_uuid.txt )
git add .
git commit -m "$x"
git push
