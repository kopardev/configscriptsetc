#!/usr/bin/env bash

# based off of https://github.com/kopardev/activitygenerator
if [ "$(uname)" == "Darwin" ];then
rl="/usr/local/bin/greadlink"
elif [ "$(uname)" == "Linux" ];then
rl="/usr/bin/readlink"
fi


# cd to clone location
cd $(/usr/bin/dirname $($rl -f $(/usr/bin/basename $0)))
# run script to generate random string in file "random_uuid.txt"
/usr/bin/bash create_random_uuid.sh
# commit the new file to github
x=$(/usr/bin/cat random_uuid.txt )
/usr/bin/git add .
/usr/bin/git commit -m "$x"
/usr/bin/git push
