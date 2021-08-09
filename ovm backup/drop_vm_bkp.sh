#!/bin/bash
# Author Brokedba https://twitter.com/BrokeDba

strings=(
Myvm1
Myvm2
myvm3
)

for i in "${strings[@]}"; do
/opt/ovm-bkp/bin/ovm-listbackup.sh  "$i"|awk -F'    == ' '{print $3}'| cut -d ' ' -f 1 | grep "\S" | awk '{print "/opt/ovm-bkp/bin/ovm-delete.sh " $0}' #>> drop_bkps.sh
done
#drop_bkps.sh
