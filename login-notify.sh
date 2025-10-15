#!/bin/bash
tail -fn0 /var/log/syslog | \
while read line ; do
        echo "$line" | grep "uccessful login"
        if [ $? = 0 ]
        then
           myuser=(`echo $line | awk -F " " '{print $6, $9}'`)
           /usr/local/emhttp/webGui/scripts/notify -s "${myuser[0]} Unraid login attempt" -i "alert" -m "${myuser[0]} login attempt to UNRAID by ${myuser[1]}"  -d "${myuser[0]} login by user ${myuser[1]}"
        fi
        
done