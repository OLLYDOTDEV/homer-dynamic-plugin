#! /bin/bash
 echo  "#--------[Client Confix]--------#"
 echo -e "\n"

# `| xargs` is used to removes extra spaces from input 
 Client_Ip_Address="$(hostname -I |grep -E '^([0-9]{,3}\.[0-9]{,3}\.[0-9]{,3}\.[0-9]{,3})' -o| xargs)" #  Gets  list of all ip's then only outputs the first set of ip address like numbers in formate of xxx.xxx.xxx.xxx 
 Client_Hostname="$(hostname|awk -F '--' '{print $1}'| xargs )" # gets just the hostname from the hostname of the machine as the hostname also inclued the port the it has a service running on 
 Client_Service_Port="$(hostname| awk -F '--' '{print $2}'| xargs)" # gets port from hostname

 echo "Ip address: " $Client_Ip_Address
 echo "Hostname: " $Client_Hostname
 echo "Server Port:" $Client_Service_Port

 SSH_Username="$(cat settings.conf | grep -E 'SSH_Username' | cut -d ":" -f "2"| xargs)"
 SSH_Host="$(cat settings.conf | grep -E 'SSH_Host' | cut -d ":" -f "2"| xargs)"
 SSH_Port="$(cat settings.conf | grep -E 'SSH_Port' | cut -d ":" -f "2"| xargs)"
 SSH_AuthKey="$(cat settings.conf | grep -E 'SSH_AuthKey' | cut -d ":" -f "2"| xargs)"

 echo "SSH Username: " $SSH_Username
 echo "SSH Host: " $SSH_Host
 echo "SSH Port:" $SSH_Port
 echo "SSH AuthKey:" $SSH_AuthKey

echo -e "\n"







status=$(ssh -o BatchMode=yes -o ConnectTimeout=5 $SSH_Username"@"$SSH_Host "-p" $SSH_Port "-i" $SSH_AuthKey echo ok 2>&1)

if [[ $status == ok ]] ; then
  echo "Auth Ok, Connected to Host"

ssh $SSH_Username"@"$SSH_Host "-p" $SSH_Port "-i" $SSH_AuthKey "hostname"

elif [[ $status == "Permission denied"* ]] ; then
  echo "No Auth Failed to Connect to Host, Exiting "
else
  echo "Encountered Unknown Error"
fi


#https://www.cyberciti.biz/faq/linux-unix-osx-bsd-ssh-run-command-on-remote-machine-server/


