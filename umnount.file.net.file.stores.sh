#!/bin/bash
#######<><
#
# wseaman 1/2014
#
########<><
#set -x
#trap read debug
#
underline=`tput smul`
nounderline=`tput rmul`
bold=`tput bold`
normal=`tput sgr0`
STDIR=/usr/local/jboss/jboss-as
DATE=`date +%Y.%m.%d"_"%H":"%M`
LOG=/var/log/restart_jboss.log
MAIL_LIST=/home/jboss/jboss-as/usr/local/admin.restart.mail.list.data
#trap 'rm $STDIR/restart.$DATE' 0 2
#
# Make sure only Jboss can run our script
if [ "$(id -u)" != "500" ]; then
   echo ""
   echo "${bold}*******${normal} This script must be run with ${underline}JBoss${nounderline} user ID ${bold}*******${normal}" 1>&2
   echo ""
   exit 1
fi
#
echo "" >> $LOG
echo "MANUAL PROCESS PERFORMED $DATE" >> $LOG
clear
#
echo ""
echo "${underline}FileNet Administrative Restart Process${nounderline}"
echo ""
echo "TIP: Ctrl+c to exit running process "
echo ""
echo "${underline}                                                     ${nounderline}"
echo ""
echo -n "Current Status: "
/etc/init.d/jboss status
echo ""
echo "${underline}                                                     ${nounderline}"
echo ""
echo ""
PS3='Please enter your choice: '
options=("FileNet Status" "Stop FileNet" "Start FileNet" "Restart FileNet" "Stop Component Manager" "Start Component Manager" "Restart FileNet & Component Mgr" "Quit")
select opt in "${options[@]}"
do
    case $opt in
#
#
        "FileNet Status")
	/etc/init.d/jboss status
	echo ""
            ;;
#
#
        "Stop FileNet")
	/etc/init.d/jboss force-stop | tee -a $LOG
	[ -f /usr/local/jboss/jboss-as/stdout.log ]
        cp $STDIR/stdout.log $STDIR/$DATE.stdout.log
	echo -n "stdout.log copy completed > " | tee -a $LOG
	ls $STDIR/$DATE.stdout.log | tee -a $LOG
	/etc/init.d/jboss status
	    break
            ;;
#
#
        "Start FileNet")
	/etc/init.d/jboss start | tee -a $LOG
	echo ""
	tail -f $STDIR/stdout.log | grep "Started"
	    break
            ;;
#
#
        "Restart FileNet")
	/etc/init.d/jboss restart | tee -a $LOG
	echo ""
	tail -f $STDIR/stdout.log | grep "Started"
	    break
            ;;
#
#
        "Stop Component Manager")
	 /opt/IBM/FileNet/AE/Router/routercmd.sh -autostop | tee -a $LOG
	echo ""
	    break
            ;;
#
#
        "Start Component Manager")
	 /opt/IBM/FileNet/AE/Router/routercmd.sh -autostart | tee -a $LOG
	echo ""
	    break
            ;;
#
#
        "Restart FileNet & Component Mgr")
	/etc/init.d/jboss start | tee -a $LOG
	    while [ `tail -f /usr/local/jboss/jboss-as/stdout.log` -ne 'JBoss_5_1_0_GA' ]
	    do
	    sleep 5
	    done
 	    echo "JBoss FileNet Start Completed ..."
	    sleep 3
	    echo ""
	/opt/IBM/FileNet/AE/Router/routercmd.sh -autostart | tee -a $LOG
	    break
            ;;
#
#
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
echo ""
