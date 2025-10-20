#!/bin/bash
tail -fn0 /var/log/syslog | \
while read line ; do
        echo "$line" | grep "uccessful login" #currently syslog uses this format for logins, works for Successful and Unsuccessful logins
        if [ $? = 0 ]
        then
           notify_array=(`echo $line | awk -F " " '{print $6, $9, $11}'`) #index 6 and 9 of the awk command should be Successful/Unsuccessful and the username attempted
           #puts the login attempt success state and user used into the array notify_array
           #added the IP address from syslog into body of message
           /usr/local/emhttp/webGui/scripts/notify -s "${notify_array[0]} Login ${notify_array[1]}" -i "alert" -m "${notify_array[0]} login attempt to UNRAID by ${notify_array[1]}"  -d "${notify_array[0]} login by user ${notify_array[1]} at IP ${notify_array[2]}"
        fi
        
done