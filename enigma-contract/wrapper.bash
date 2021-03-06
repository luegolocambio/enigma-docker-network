#!/bin/bash
export CONTRACT_IP=`/sbin/ifconfig eth0 | awk '/inet addr/ {gsub("addr:", "", $2); print $2}'`
echo "My IP address is " $CONTRACT_IP
sed -i'' -e "s/127.0.0.1\:8545/$CONTRACT_IP\:8545/g" ~/enigma-contract/integration/coin-mixer.js 
sed -i'' -e "s/localhost\:8545/$CONTRACT_IP\:8545/g" ~/enigma-contract/integration/coin-mixer.js
sed -i'' -e "s/127.0.0.1/$CONTRACT_IP/g" ~/enigma-contract/truffle.js
sed -i'' -e "s/localhost/$CONTRACT_IP/g" ~/enigma-contract/truffle.js
cd ~/enigma-contract && ~/ganache-cli -h $CONTRACT_IP
