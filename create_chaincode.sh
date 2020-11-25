#!/bin/bash
set -x #echo on
​
CHAINCODE_NAME="transaction"
CHAINCODE_CLASS_NAME="TransactionChaincode"

platform='unknown'
unamestr=$(uname)
if [ "$unamestr" = 'Linux' ]; then
   platform='linux'
elif [ "$unamestr" = 'FreeBSD' ]; then
   platform='freebsd'
fi

if [ "$platform" = 'linux' ]; then

   find ./chaincode/ -type f -exec sed -i "s/CHAINCODE-NAME/$CHAINCODE_NAME/g" {} \; && 
   find ./chaincode/ -type f -exec sed -i "s/CHAINCODE_CLASS_NAME/$CHAINCODE_CLASS_NAME/g" {} \;

elif [ "$platform" = 'freebsd' ]; then

  find ./chaincode/ -type f -exec sed -i '.bak' "s/CHAINCODE-NAME/$CHAINCODE_NAME/g" {} \;&&
  find ./chaincode/ -type f -exec sed -i '.bak' "s/CHAINCODE_CLASS_NAME/$CHAINCODE_CLASS_NAME/g" {} \;

fi