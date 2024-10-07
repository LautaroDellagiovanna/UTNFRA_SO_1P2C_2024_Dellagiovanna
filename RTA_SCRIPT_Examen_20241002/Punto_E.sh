#!/bin/bash

ARCHIVO=~/repogit/UTNFRA_SO_1P2C_2024_Dellagiovanna/RTA_ARCHIVOS_Examen_20241002/Filtro_Basico.txt

cat /proc/meminfo | grep -i memtotal > ${ARCHIVO}
echo 'Chasis Information' >> ${ARCHIVO}
sudo dmidecode -t chassis | grep -i manufacturer >> ${ARCHIVO}

cat $ARCHIVO
