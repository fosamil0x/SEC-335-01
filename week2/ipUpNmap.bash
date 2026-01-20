#!/bin/bash

# list ip's in a given network prefix
# /24 only

# usage: bash ipUpNmap.bash 10.0.17
[ "$#" -ne 1 ] && echo "Usage: $0 <Prefix>" && exit 1

# prefix is the first input taken
prefix="$1"

# Verify Input Length
[ ${#prefix} -lt 5 ] && \
printf "Prefix is too short\nPrefix example: 10.0.17\n" && \
exit 1

for i in {1..50}
do
hostUp=$(sudo nmap -n -vv -sn "${prefix}.$i"| grep "Host is up")
	if [[ -n "$hostUp" ]]; then
		echo "${prefix}.$i" >> sweep3.txt
	fi
done
