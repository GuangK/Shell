#!/bin/bash

. /etc/init.d/functions

for user in red{3..8}
do
    passwd=`echo $user | md5sum | cut -c 1-10`
    if [ `id $user 2> /dev/null | wc -l` -ge 1 ]
    then
        action "$user Exist!" /bin/false
        continue
    fi
    useradd $user &> /dev/null && {
        echo "$passwd" | passwd --stdin $user &> /dev/null
        echo -e "$user\t$passwd" >> /tmp/user.txt
    }
    if [ $? -eq 0 ]
    then
        action "$user is OK." /bin/true
    else
        action "$user is not OK." /bin/false
    fi
done
