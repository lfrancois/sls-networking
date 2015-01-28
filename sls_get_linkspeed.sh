#!/bin/bash

if [[ -z $1 ]]
then
  ECME_IP=ecme-3-c2c-node
else 
  ECME_IP=$1
fi

NODE_NUM=48

printf "Link[1-4] has to be 10.0 (connected) or 0 (unconnected)\n\n"
printf "\t\t\tLink0\tLink1\tLink2\tLink3\tLink4(Gbps)\n"

function add_sled_cr()
{
  SLED=$(($node % 4))
  if [ $SLED == 0 ] && [ $node != 0 ];
  then
    printf "\n"
  fi
}

for ((node = 0; node < $NODE_NUM; node++));
do
#  add_sled_cr
  NODE=`printf "$ECME_IP%02d" $node`
  printf "%s\t" $NODE
  for ((link = 0; link < 5; link++));
  do
    LINKSPEED=`ipmitool -U admin -P admin -H $NODE cxoem fabric get linkspeed link $link actual`
    printf "%5.1f\t" $LINKSPEED
  done
  echo
done

