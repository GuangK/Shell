#!/bin/bash
usage(){
    if [[ ! $1 =~ http://www.*com ]]
    then
        echo "Usage:$0 http://www.xx.com"
        exit 1
    fi
}
check_url(){
    wget -q $1 &> /dev/null
    retval=$?
    if [ $retval -eq 0 ]
    then
        echo "url is OK."
    else
        echo "url is not OK."
    fi
}

main(){
    usage $1
    check_url $1
}

main $*
