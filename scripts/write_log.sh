#!/bin/bash
#
#
DATE=`date`
LOGFILE=/home/wseaman/butch_tsting/log/log1
ls /tmp/butch 2> /dev/null

STATUS=$?
#
#echo $STATUS
if [ $STATUS == 0 ]
then
echo "YES FILE"
echo "YES ... File Found" >> $LOGFILE
exit
else
#echo "NO FILE"
echo "No File Found $DATE" >> $LOGFILE
fi
