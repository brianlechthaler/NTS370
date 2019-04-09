#/bin/bash
#Project 1.3 nmap Script

echo "Enter subnet (ex: 10.0.0.):"
read subnet

echo "Enter the beginning of the IP address:"
read startIP

echo "Enter the ending of the IP address:"
read endIP

nmap -oN "$(date +%b%e-%y)_output.txt" $subnet$startIP-$endIP