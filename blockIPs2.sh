#!/bin/bash

#This script blocks all flows between IPs listed in Block_Ips.csv and target (10.0.0.5)
export IFS=","
while read var ip
do
	printf "$var"
	printf "\nBlocking IP: $ip\n"
	curl -X POST -d '{"src-ip":"'$ip'", "dst-ip": "10.0.0.5", "action":"DENY", "priority":"50"}' http://localhost:8080/wm/firewall/rules/json
	printf "\n"
done < Block_Ips.csv 
rm Block_Ips.csv
printf "\n"
