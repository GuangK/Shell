#!/bin/bash

. /etc/init.d/functions

for ip in {1..255}
do
    ping -W 1 -c 1 192.168.132.$ip &> /dev/null
    if [ $? -eq 0 ]
    then
        #echo "192.168.132.$ip is alive."
        action "192.168.132.$ip is alive." /bin/true
    else
        #echo "192.168.132.$ip is dead!"
        action "192.168.132.$ip is dead." /bin/false
    fi
done
