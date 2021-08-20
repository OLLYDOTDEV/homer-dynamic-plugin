#! /bin/bash
# https://linuxhandbook.com/bash-arrays/

Ip_Address=("192.168.1.1" "192.168.1.2" "192.168.1.3")

Ports=("8080" "80" "90")

Hostname=("test1" "test2" "test3")

database_file="temp.txt" #file that is being used to store all data 



Array_Write () {  # used to write array to file 


# check length of arrays arrays are the same
# ${#Ports[@]} <--- using # prints number of elements in array
for (( element=0; element<=${#Ports[@]}-1;element++));
do

#echo $element

echo ${Ip_Address[$element]} ${Ports[$element]} ${Hostname[$element]} >>  $database_file  
done

}

Array_Read () { # used to read array from file

#mapfile dataarray < $database_file
Ip_Address=($(awk '{print $1}' $database_file))
Port=($(awk '{print $2}' $database_file))
Hostname=($(awk '{print $3}' $database_file))

echo ${Ip_Address[1]}
echo ${Port[1]}
echo ${Hostname[1]}



}

Array_Contains () { 
# from https://stackoverflow.com/questions/14366390/check-if-an-element-is-present-in-a-bash-array 
   local array="$1[@]"
    local seeking=$2
    local in=1
 for element in "${!array}"; do
        if [[ $element == "$seeking" ]]; then
            in=0
	break 
	fi

	break
done
return $in # returned valued of 0 = true
}

somevar="192.168.1.5"

list=("192.168.1.1" "192.168.1.2" "192.168.1.3")
#Array_Contains list "$somevar"  && match=true || match=false

if $match
then 
	echo "Match Found"
else
 echo "No Match"
fi

Array_Read
#Array_Write


