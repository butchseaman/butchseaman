
#!/bin/bash
# Script to add a user to Linux system
# wseaman 2015.05.21
#
if [ $(id -u) -eq 0 ]; then
        read -p "Enter username : " username
        read -p "User Description : " comment
        read -s -p "Enter password : " password
        egrep "^$username" /etc/passwd >/dev/null
        if [ $? -eq 0 ]; then
                echo "$username exists!"
                exit 1
        else
                pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
                /usr/sbin/useradd -c "$comment" -m -p $pass $username ; chage -d 0 $username ; chage -m 7 -M 90 -W 14 $username
                [ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
        fi
else
        echo "Only root may add a user to the system"
        exit 2
fi
