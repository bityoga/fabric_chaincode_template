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

   sed -i "s/CHAINCODE-NAME/$CHAINCODE_NAME/g" *

elif [ "$platform" = 'freebsd' ]; then

  sed -i '.bak' "s/CHAINCODE-NAME/$CHAINCODE_NAME/g" *

fi