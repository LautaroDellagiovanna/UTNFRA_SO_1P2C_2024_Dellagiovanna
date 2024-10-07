#!/bin/bash

DISK=$(sudo fdisk -l | grep -i "10 gib" | awk '{print $2}' | tr -d ':')

echo ${DISK}

contador=1

{
while [ $contador -le 11 ]
do
	echo "n"
	if [ $contador -eq 4 ]
	then
		echo "e"
		echo ""
		echo ""
		echo ""
	else
		if [ $contador -le 4 ]
		then
			echo "p"
			echo ""
			echo ""
			echo "+1G"
		else
			if [ $contador -eq 11 ]
			then
				echo ""
				echo ""
				echo ""
			else
				echo ""
				echo "+1G"
			fi
		fi
	fi
	contador=$(( $contador + 1 ))
done
echo "w"
} | sudo fdisk ${DISK}

contador=1
contador2=1
contador3=1

while [ $contador -le 12 ]
do
	if [ $contador -ne 4 ]
	then
		sudo mkfs -t ext4 ${DISK}${contador}
		
		if [ $contador -ne 11]
		then
			echo $DISK$contador" /Examenes-UTN/alumno_"${contador2}"/parcial_"${contador3}" ext4 defaults 0 0" | sudo tee -a /etc/fstab
			contador3=$(( contador3 + 1 ))
		else
			echo $DISK$contador" /Examenes-UTN/profesores/ ext4 defaults 0 0" | sudo tee -a /etc/fstab
		fi
		contador=$(( $contador + 1 ))

		if [ $contador2 -gt 3 ]
		then
			contador2=1
		fi
		if [ $contador3 -gt 3 ]
		then
			contador3=1
			contador2=$(( contador2 + 1 ))
		fi
	fi
done

sudo mount -a
