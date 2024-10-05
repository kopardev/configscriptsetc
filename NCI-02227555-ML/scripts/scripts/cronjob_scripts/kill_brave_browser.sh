#!/usr/bin/env bash
# kill brave browser if it uses more than 50% of the memory
# use ps to get 
# etime = elapsed time ... time the program has been running
# ppid = parent process id
# pid = process id
# of all the brave browser subprocesses
ps -ax -o etime,ppid,pid,pmem,command|grep -i "/Applications/Brave Browser.app"|grep -v grep|awk '{print $1,$2,$3,$4}' > /tmp/bbps.txt
# example bbps.txt
# 00:33 1 75508 3.0
# 00:33 1 75511 0.1
# 00:32 75508 75529 0.5
# 00:32 75508 75530 0.3
# 00:32 75508 75531 0.2
# 00:31 75508 75538 0.4
# 00:31 75508 75540 0.4
# 00:31 75508 75541 0.4
# 00:31 75508 75542 0.3
# 00:31 75508 75543 0.4
# 00:28 75508 75587 0.2
# 00:28 75508 75602 0.5
# 00:26 75508 75609 0.6
# 00:23 75508 75612 0.6
# 00:22 75508 75614 0.4
# 00:21 75508 75619 0.7
# 00:20 75508 75620 0.2
# calculate memory of all process and subprocesses
bbmem=$(awk '{sum=sum+$4}END{print sum}' /tmp/bbps.txt|awk -F"." '{print $1}')
# if bbmem > 50 then delete all parent processes
# parent processes have second column equal to 1 in bbps.txt
if [ $bbmem -gt 50 ];then 
  for i in $(awk '{if($2==1){print $3}}' /tmp/bbps.txt|sort|uniq);do 
    kill -9 $i;
  done;
fi
# cleanup
rm -f /tmp/bbps.txt
