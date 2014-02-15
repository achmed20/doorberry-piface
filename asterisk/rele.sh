##!/bin/bash

echo "rele.sh $*" >> /tmp/rele.log

case $1 in
    "1") 
	gpio -p write 200 1
	sleep 2
	gpio -p write 200 0
    ;;
    
    "2") 
	gpio -p write 201 1
	sleep 2
	gpio -p write 201 0
    ;;

esac

