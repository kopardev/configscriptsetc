#!/usr/bin/env bash
#find password boss pid if it is running for more than 24 hours
pbossid=$(ps -ax -o etime,pid,command|grep -m1 -i "/Applications/Password Boss.app/Contents/MacOS/Password Boss"|grep -v grep|sed "s@^ *@@g"|sed "s@ @:@g"|awk -F":" '{if ($1>24){print $4}}')
if [ "$pbossid" != "" ];then
	kill -9 $pbossid
fi
