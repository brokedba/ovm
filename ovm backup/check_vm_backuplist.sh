#!/bin/bash
# Author Brokedba https://twitter.com/BrokeDba

strings=(`ls -1a /opt/ovm-bkp/conf/vm/*.conf | tr '\n' '\0' | xargs -0 -n 1 basename|awk -F- '{print $1}' |tr " " "\n"`)
for i in "${strings[@]}"; do
/opt/ovm-bkp/bin/ovm-listbackup.sh  "$i"
done