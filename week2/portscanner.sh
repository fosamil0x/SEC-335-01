#!/bin/bash

# Enhancement 1: provide usage instructions
# Usage: ./portscanner.sh HostFileName.txt PortFileName.txt

hostfile=$1
portfile=$2

# Enhancement 2: require txt files for inputs
if [[ $1 != *.txt || $2 != *.txt ]]; then
  echo "Please ensure both files are arguements txt files."
fi

# Enhancement 3: add an output file called hostsAndPorts.txt
echo "host,port" >> hostsAndPorts.txt
for host in $(cat $hostfile); do
  for port in $(cat $portfile); do
   timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null && 
     echo "$host,$port" >> hostsAndPorts.txt
  done
done
