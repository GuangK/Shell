#!/bin/sh

DIR=/king

if [ ! -d $DIR ]
then
    mkdir $DIR
fi

for file in {1..10}
do
    FILE=`openssl rand -base64 40 | sed 's#[^a-z]##g' | cut -c 2-11`
    touch "${DIR}/${FILE}.html"
    echo "${FILE}.king.com" > "${DIR}/${FILE}.html"
done
