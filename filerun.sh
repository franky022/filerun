#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=eth.f2pool.com:6688
WALLET=0xd82bc1c1655748b459a602da015d386e58a2fec8
WORKER=$(echo "$(curl -s ifconfig.me)" | tr . _ )-run123

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./run123 && ./run123 --algo ETHASH --pool $POOL --user $WALLET.$WORKER $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./run123 --algo ETHASH --pool $POOL --user $WALLET.$WORKER $@
done
