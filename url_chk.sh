#!/bin/bash

arr=(
    www.baidu.com
    www.king.com
    www.jd.com
    www.dfasf.com
    )

while true
do
    for url in ${arr[*]}
    do
        wget -q -o /dev/null --spider -T 10 --tries=2 $url &> /dev/null
        retval=$?
        if [ $retval -eq 0 ]
        then
            echo "$url is OK."
        else
            echo "$url is not OK."
        fi
    done
    sleep 5
done
~     
