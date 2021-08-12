#! /bin/bash
# https://linuxhandbook.com/bash-arrays/

Ip_Address=("192.168.1.1" "192.168.1.2" "192.168.1.3")

Ports=("8080" "80" "90")

Hostname=("test1" "test2" "test3")





Array_Write () {


# check length of arrays arrays are the same
# ${#Ports[@]} <--- using # prints number of elements in array
for (( element=0; element<=${#Ports[@]}-1;element++));
do

#echo $element

echo ${Ip_Address[$element]} ${Ports[$element]} ${Hostname[$element]} >>  temp.txt
done

}

Array_Read () {

mapfile dataarray < temp.txt 
echo ${dataarray[@]}


}

Array_Read
#Array_Write


