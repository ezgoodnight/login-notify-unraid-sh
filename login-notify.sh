#!/bin/bash
tail -fn0 /var/log/syslog | \
while read line ; do
        echo "$line" | grep "uccessful login" #currently syslog uses this format for logins, works for Successful and Unsuccessful logins
        if [ $? = 0 ]
        then
           myuser=(`echo $line | awk -F " " '{print $6, $9}'`) #index 6 and 9 of the awk command should be Successful/Unsuccessful and the username attempted
           #puts the login attempt success state and user used into the array myuser
           /usr/local/emhttp/webGui/scripts/notify -s "${myuser[0]} Unraid login attempt" -i "alert" -m "${myuser[0]} login attempt to UNRAID by ${myuser[1]}"  -d "${myuser[0]} login by user ${myuser[1]}"
        fi
        
done