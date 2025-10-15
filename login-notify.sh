#!/bin/bash
tail -fn0 /var/log/syslog | \
while read line ; do
        echo "$line" | grep "Unsuccessful login"
        if [ $? = 0 ]
        then
           myuser=`echo "$line" | awk -F " " '{print $9}'`
           /usr/local/emhttp/webGui/scripts/notify -s "Unraid failed login attempt" -i "alert" -m "${myuser} just failed to log into Unraid"  -d "${myuser} just failed to log into Unraid"
        fi
        echo "$line" | grep "Successful login"
        if [ $? = 0 ]
        then
           myuser=`echo "$line" | awk -F " " '{print $9}'`
           /usr/local/emhttp/webGui/scripts/notify -s "Unraid successful login" -i "alert" -m "${myuser} just logged into Unraid"  -d "${myuser} just logged into Unraid"
        fi
done