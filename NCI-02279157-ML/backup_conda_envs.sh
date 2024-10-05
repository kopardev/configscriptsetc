#!/bin/bash
cd /Users/kopardevn/Documents/GitRepos/configscriptsetc/NCI-02279157-ML

# Loop through each environment and export it to a YAML file
for env in $(conda env list | awk '{print $1}' | tail -n +4); do
    conda env export --name "$env" > ./conda-env-backup/"$env".yml
done
