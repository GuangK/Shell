#!/bin/bash

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

    check_url $1
}

main $*
