#!/bin/bash

counter=0

while [ $counter -lt 50 ]; do
 counter=$(($counter+1))
 name=$(nl people.txt  | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $1}')
 lastname=$( nl people.txt  | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $2}')
 age=$(shuf -i 20-25 -n 1)

lastname=${lastname//[$'\t\r\n ']}

 mysql -u root -pchangeme people -e "insert into register values($counter, '$name', '$lastname', $age)"
echo " $counter is: $name, $lastname, $age was correctly imported"
done
i
