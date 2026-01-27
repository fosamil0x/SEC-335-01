#!/bin/bash

# Enhancement 1: provide usage instructions
# Usage: ./portscanner.sh Network.ID.Here DNS.Server.IP.Here

net_pre=$1
dns_serv=$2


# Enhancement 2: require two arguments
if [ $# -ne 2 ]; then
	echo "Please provide a network ID and DNS server IP for the script. Ex, './dns-resolver.sh Network.ID.Here DNS.Server.IP.Here' ."
	exit 1
fi

#run nslookup against /24 network with the provided prefix and dns server
echo "dns resolution for $1 against $2"
for host in {1..254}; do
   hostname=$(nslookup $1.$host $dns_serv | grep 'name = ')

#print hostname (dns info) if it isn't empty
  if [[ ! -z "$hostname" ]]; then
    echo "$hostname"
  fi
done
