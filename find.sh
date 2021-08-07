#! /bin/bash
 echo  "#--------[Client Confix]--------#"
 echo -e "\n"



 Client_Ip_Address="$(hostname -I |grep -E '^([0-9]{,3}\.[0-9]{,3}\.[0-9]{,3}\.[0-9]{,3})' -o)"
 Client_Hostname="$(hostname|awk -F '--' '{print $1}' )"
 Client_Service_Port="$(hostname| awk -F '--' '{print $2}')"


 echo "Ip address: " $Client_Ip_Address
 echo "Hostname: " $Client_Hostname
 echo "Server Port:" $Client_Service_Port

 echo

 SSH_Username="$(cat settings.conf | grep -E 'SSH_Username' | cut -d ":" -f "2")"
 SSH_Host="$(cat settings.conf | grep -E 'SSH_Host' | cut -d ":" -f "2")"
 SSH_Port="$(cat settings.conf | grep -E 'SSH_Port' | cut -d ":" -f "2")"
 SSH_AuthKey="$(cat settings.conf | grep -E 'SSH_AuthKey' | cut -d ":" -f "2")"

 echo "SSH Username: " $SSH_Username
 echo "SSH Host: " $SSH_Host
 echo "SSH Port:" $SSH_Port
 echo "SSH AuthKey:" $SSH_AuthKey

echo -e "\n"


