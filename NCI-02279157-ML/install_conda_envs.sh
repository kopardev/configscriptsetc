#!/bin/bash
cd /Users/kopardevn/Documents/GitRepos/configscriptsetc/NCI-02279157-ML
if [ -d ./conda-env-backup-cleanedup ]; then
    rm -rf ./conda-env-backup-cleanedup
fi
mkdir ./conda-env-backup-cleanedup

for yml in $(ls ./conda-env-backup/*.yml); do
    echo "Cleaning up $yml"
    bn=$(basename $yml)
    env_name=$(cat $yml | grep "name:" | awk '{print $NF}')
    echo "Environment name: $env_name"
    echo "Creating cleaned up conda environment file"
    ./cleanup_conda_env.py $yml ./conda-env-backup-cleanedup/$bn
    if [ $? -ne 0 ]; then
        echo "Error cleaning up conda environment $yml"
        continue
    fi
    # Check if the conda environment exists
    if conda env list | grep -q "^$env_name\s"; then 
        echo "Conda environment $env_name already exists"
        continue
    fi
    echo "Creating conda environment from $yml"
    conda env create --file ./conda-env-backup-cleanedup/$bn
done
