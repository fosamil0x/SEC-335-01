#!/bin/bash

# Enhancement 1: provide usage instructions
# Usage: ./portscanner.sh Network.ID.Here PortNumber

net_pre=$1
port=$2


# Enhancement 2: require two arguments
if [ $# -ne 2 ]; then
	echo "Please provide a network ID and port number for the script. Ex, ./portscanner2.sh Network.ID.Here PortNumber."
	exit 1
fi

# Enhancement 3: add an output file called hostsAndPorts.txt
echo "ip,port" >> ipsAndPorts.txt
for host in {1..254}; do
   timeout .1 bash -c "echo >/dev/tcp/$net_pre.$host/$port" 2>/dev/null && 
     echo "$net_pre.$host,$port" >> ipsAndPorts.txt
done
