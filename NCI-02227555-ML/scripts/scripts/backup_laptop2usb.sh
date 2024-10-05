#!/bin/bash

x=$(dirname -- "${BASH_SOURCE[0]}")
SCRIPTDIR=$(realpath $x)

d=`date +"%m%d%y%H%M%S"`
BACKUPDIR=/Volumes/LBR/LaptopBackup2
if [[ ! -d $BACKUPDIR ]];then
  echo "LBR external drive not mounted!!"
  exit
fi

#echo $x
#echo $SCRIPTDIR
#echo $d
#echo $BACKUPDIR
#ls $SCRIPTDIR/backup_dirlist.txt

while read folder;do

basedir=$(basename "$folder")

#echo "$folder"
#echo $basedir
#echo "${BACKUPDIR}/BackupLogs/${basedir}"

if [[ ! -d "${BACKUPDIR}/BackupLogs/${basedir}" ]];then
mkdir -p "${BACKUPDIR}/BackupLogs/${basedir}"
fi
rsync -azuvrt "${folder}" "${BACKUPDIR}/"

done < $SCRIPTDIR/backup_dirlist.txt
