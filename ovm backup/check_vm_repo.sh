#!/bin/bash
# Author Brokedba https://twitter.com/BrokeDba
echo
echo
echo ===================================================================================
echo -e "\t      CURRENT OVM REPOSITORIES  AND THEIR FS TYPE"
echo ===================================================================================
ovs-agent-db dump_db repository | grep 'alias\|filesystem\|mount_point'
sleep 2
for  dir in $(ovs-agent-db dump_db repository | grep 'mount_point' | awk -F\' '{print $4}')
do
repo=`echo $dir | cut -f 4 -d/`
repo=`ovs-agent-db dump_db repository |awk -v p="${repo}': {'alias'" -F\' '$0 ~ p{print $6}'`
sleep 2
echo ====================================================================================
echo -e "\t    VMs for Repository "$repo" Directory: "$dir""

echo ====================================================================================
for i in $(find $dir/VirtualMachines -name vm.cfg);
do   echo  $i | cut -f 6 -d/ |sed 's/$/ => /' |tr -d '\n' ;  cat $i | grep OVM_simple_name; done
done