#!/bin/bash
#
clear
#
#gnome-terminal --geometry=130x30+300+300+100+100
#
txtrst=$(tput sgr0) # Text reset
txtred=$(tput setaf 1) # Red
txtgrn=$(tput setaf 2) # Green
txtylw=$(tput setaf 3) # Yellow
txtblu=$(tput setaf 4) # Blue
txtpur=$(tput setaf 5) # Purple
txtcyn=$(tput setaf 6) # Cyan
txtwht=$(tput setaf 7) # White
#
DATE=`date +%Y.%m.%d"_"%H":"%M`
#
echo ""
echo "${txtred}***************************************************************************${txtrst}"
echo " This script will Secure Copy from a given SOURCE server                 "
echo " to a given DESTINATION directory on this server                         "
echo "                                                                         "
echo " Exit this script by pressing the C key while holding down the Ctrl key  "
echo "${txtred}***************************************************************************${txtrst}"
echo ""
echo ""
echo "${txtgrn}Do you wish to remove the following Files/Directories for new deployment:${txtrst} "
echo ""
echo "****************************************************************"
ls -d /home/jboss/jboss-5.1.0.GA/server/ApplicationEngine/work/jboss.web/localhost/Remedy*
echo ""
ls -d /home/jboss/jboss-5.1.0.GA/server/ApplicationEngine/tmp
echo ""
echo "****************************************************************"
echo ""
#/bin/echo ${txtblu}"Type y=yes n=no:"${txtrst}
read -p ${txtwht}"Type y=yes n=no: "${txtrst} RMV
if [ $RMV = y ]; then
mkdir /tmp/RGC$DATE
#mv /home/jboss/jboss-5.1.0.GA/server/ApplicationEngine/tmp/* /tmp/RGC$DATE/
#mv /home/jboss/jboss-5.1.0.GA/server/ApplicationEngine/work/jboss.web/localhost/RemedyGameChangers /tmp/RGC$DATE/
#mv /home/jboss/jboss-5.1.0.GA/server/ApplicationEngine/work/jboss.web/localhost/RemedyServices /tmp/RGC$DATE/
fi
echo ""
read -p "Enter ${txtred}SOURCE${txtrst} Server: " SRC1
echo ""
read -p "Enter ${txtred}SOURCE${txtrst} Location: " SRC2
#
if ssh $SRC1 "[ -f $SRC2 ]"; then
echo ""
else
echo ""
echo "***><>${txtred} FILE NOT FOUND - ABORTING TRANSFER ${txtrst}<><***"
echo ""
read -p ${txtred}"        PRESS ENTER KEY TO CLOSE WINDOW"${txtrst}
echo ""
#sleep 15
exit
fi
#
echo ""
echo "Enter ${txtred}Destination${txtrst} Location\n"
read DEST2
#
echo ""
echo ""
echo "You have Selected the Following Transfer:"
echo ""
echo ${txtblu}"Source: $SRC1 $SRC2"${txtrst}
echo ""
echo ${txtcyn}"Destination: $DEST2"${txtrst}
echo ""
read -p ${txtred}"y=Yes n=No: "${txtrwst} ANS
if [ $ANS = n ]; then
echo "Transfer Aborted"
fi
scp $SRC1:$SRC2 $DEST2
#

#######logging
echo "" >> /var/log/jboss_transfer.log
echo $DATE >> /var/log/jboss_transfer.log
echo "Files Removed for Deployment: $RMV" >> /var/log/jboss_transfer.log
echo "Source File: $SRC1:$SRC2" >> /var/log/jboss_transfer.log
echo "Destination: $DEST2" >> /var/log/jboss_transfer.log
echo "*******><> END OF LOG ENTRY <><*******"

