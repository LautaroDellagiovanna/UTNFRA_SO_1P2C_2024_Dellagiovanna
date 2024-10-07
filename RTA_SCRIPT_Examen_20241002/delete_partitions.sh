#!/bin/bash

DISK=$(sudo fdisk -l | grep -i "10 gib" | awk '{print $2}' | tr -d ':')

echo ${DISK}

contador=1

{
while [ $contador -le 11 ]
do
        echo "d"
	echo ""
        contador=$(( $contador + 1 ))
done
echo "w"
} | sudo fdisk ${DISK}
