#!/bin/sh
# /etc/init.d/lanciamotion.sh
#
### BEGIN INIT INFO
# Provides:	  lanciamotion.sh
# Required-Start: $local_fs $syslog $remote_fs
# Required-Stop: $remote_fs
# Default-Start:  2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: Start Motion detection
# Description: loads motion and assigns privileges
### END INIT INFO
NUM=25
( 
until ping -nq -c1 8.8.8.8; do
   echo "$NUM Waiting for internet access to get first date/time..."
   NUM=`expr $NUM - 1`
   if [ $NUM -eq 0 ]; then
      break;
   fi
done
ntpdate -p 1 -u ntp2.inrim.it
nohup motion &
 ) &

exit 0
