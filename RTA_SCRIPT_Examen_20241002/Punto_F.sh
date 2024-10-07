#/bin/bash

ARCHIVO=~/repogit/UTNFRA_SO_1P2C_2024_Dellagiovanna/RTA_ARCHIVOS_Examen_20241002/Filtro_Avanzado.txt

echo -n 'Mi IP pública es: ' > ${ARCHIVO}
curl -s ifconfig.me >> ${ARCHIVO}
echo '' >> ${ARCHIVO}
echo -n 'Mi usuario es: ' >> ${ARCHIVO}
whoami >> ${ARCHIVO}
echo -n 'El hash de mi usuario es: ' >> ${ARCHIVO}
sudo grep $(whoami) /etc/shadow | awk -F ':' '{print $2}' >> ${ARCHIVO}
echo -n 'La URL de mi repositorio es: ' >> ${ARCHIVO}
git remote get-url origin >> ${ARCHIVO}
cat ${ARCHIVO}
