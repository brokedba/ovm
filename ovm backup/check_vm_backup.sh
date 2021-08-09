#!/bin/bash
# Author Brokedba https://twitter.com/BrokeDba

strings=(
Myvm1
Myvm2
myvm3
)

for i in "${strings[@]}"; do
/opt/ovm-bkp/bin/ovm-listbackup.sh  "$i"
done