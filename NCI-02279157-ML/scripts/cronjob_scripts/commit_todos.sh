#!/usr/bin/env bash

# get date
dt=$(date +"%D"|sed "s@/@@g")

# Push changes to github
cd /Users/kopardevn/Documents/GitRepos/todos/
git add .
git commit -m "daily push $dt"
git push
