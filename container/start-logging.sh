#!/bin/bash

LOGFILE="/var/log/fake-service.log"

if [[ $UID == "0" || $EUID == 0 ]]
then
    /scripts/fake-logging.pl --count=2500 --min=0.1 --max=0.7 >$LOGFILE 2>&1  &
    echo -e "producing output to\n   $LOGFILE\nnow!"
else
    echo "YOU DONT HAVE THE NECESSARY RIGHTS!!"
    echo -e "start this script like this:\n"
    echo -e ">>    sudo $(which $0)\n"
fi
