#!/bin/bash
kill -9 $(ps uax|grep -m1 -i "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"|grep -v grep|awk '{print $2}')
