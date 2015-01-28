#!/bin/bash

if [[ -z $1 ]]
then
  NODE0_IP=ecme-3-c2c-node00
else 
  NODE0_IP=$1
fi

ipmitool -U admin -P admin -H $NODE0_IP cxoem fabric config set linkspeed 10
ipmitool -U admin -P admin -H $NODE0_IP cxoem fabric config set ls_policy 0
ipmitool -U admin -P admin -H $NODE0_IP cxoem fabric config update_config
