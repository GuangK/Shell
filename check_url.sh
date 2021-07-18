#!/bin/bash

[ -f /etc/init.d/functions ] && . /etc/init.d/functions

usage(){
    if [[ ! $1 =~ http://www.*com ]]
    then
        echo "Usage:$0 http://www.xx.com"
        exit 1
    fi
}
check_url(){
	wget -q $1 &>/dev/null
	retval=$?
	if [ $retval -eq 0 ]
	then
	  action  "url is ok." /bin/true
	else
	  action "url is no." /bin/false
	fi
}
main(){
    usage $1
    check_url $1
}

main $*
