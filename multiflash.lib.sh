#!/bin/bash

# Utilities
getNetworkIp() {
  local interface=$1
  local interfaceInfo=(`ip -o -4 addr list $interface`)
  local network=${interfaceInfo[3]}
  local ip=`echo $network | cut -f1 -d "/"`
  echo "$ip"
}

getNetworkIp6() {
  local interface=$1
  local interfaceInfo=(`ip -o -4 addr list $interface`)
  local network=${interfaceInfo[3]}
  local ip=`echo $network | cut -f1 -d "/"`
  echo "$ip"
}

# Default Values
programName="$(basename $0)"
defaultInterface="eth0"
message="multiflash-debug"
networkIp=`getNetworkIp $defaultInterface`
networkIp6=`getNetworkIp6 $defaultInterface`
timeIntervalInSeconds="1"
multicastGroupIp="226.1.3.14"
multicastGroupPort="31415"

