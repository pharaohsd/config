#!/bin/bash
# Put into /etc/cron.daily/

today=`date +"%d-%m"`
cp ~/.awesomerc ~/.awesome/cfgbackups/.awesomerc-$today
