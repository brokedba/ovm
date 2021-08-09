#!/bin/bash
# Author Brokedba https://twitter.com/BrokeDba
# usage  ./check_vm_bkp_config.sh | grep myvm

strings=(`ls -1a /opt/ovm-bkp/conf/vm/*conf |tr '\n' '\0'| xargs -0 -n 1 basename|awk -F- '{print $1}'`)
for i in "${strings[@]}"; do
 echo ========== $i backup setup =========================
 cat `ls -1a /opt/ovm-bkp/conf/vm/$i*.conf` | grep 'vmname\|retention\|targetrepo'| awk 'NR%3{printf "%s ",$0;next;}1'
 echo
 done