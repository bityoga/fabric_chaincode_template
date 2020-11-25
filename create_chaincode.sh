#!/bin/bash
set -x #echo on
​
CHAINCODE_NAME="transaction"

platform='unknown'
unamestr=$(uname)
if [ "$unamestr" = 'Linux' ]; then
   platform='linux'
elif [ "$unamestr" = 'FreeBSD' ]; then
   platform='freebsd'
fi

if [ "$platform" = 'linux' ]; then

   find ./chaincode/ -type f -exec sed -i "s/CHAINCODE-NAME/$CHAINCODE_NAME/g" {} \;

elif [ "$platform" = 'freebsd' ]; then

  find ./chaincode/ -type f -exec sed -i '.bak' "s/CHAINCODE-NAME/$CHAINCODE_NAME/g" {} \;

fi