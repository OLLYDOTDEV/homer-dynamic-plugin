#! /bin/bash
echo  "#--------[Client Confix]--------#"
echo -e "\n"



ip_address="$(hostname -I |grep -E '^([0-9]{,3}\.[0-9]{,3}\.[0-9]{,3}\.[0-9]{,3})' -o)"  
hostname="$(hostname -s)"

echo "ip address: " $ip_address
echo "Hostname: " $hostname


SSH_Username="$(cat settings.conf | grep -E 'SSH_Username' | cut -d ":" -f "2")" 
SSH_Host="$(cat settings.conf | grep -E 'SSH_Host' | cut -d ":" -f "2")" 
SSH_Port="$(cat settings.conf | grep -E 'SSH_Port' | cut -d ":" -f "2")" 
SSH_AuthKey="$(cat settings.conf | grep -E 'SSH_AuthKey' | cut -d ":" -f "2")" 
echo "SSH Username: " $SSH_Username 

echo "SSH Host: " $SSH_Host 

echo "SSH Port:" $SSH_Port

echo "SSH AuthKey:" $SSH_AuthKey
