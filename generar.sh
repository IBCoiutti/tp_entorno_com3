#!/bin/bash
: """• generar.sh: Genera imágenes utilizando algún servicios web. Tener
en cuenta que al descargar de una página conviene usar un sleep entre
descarga y descarga para no saturar el servicio y evitar problemas. Se debe
poder indicar por argumento cuantas imágenes generar y se deben asignar
nombres de archivo al azar de una lista de nombres de personas. Luego
se deben comprimir las imágenes, y generar un archivo con su suma de
verificación."""

echo "Introduce el numero de imagenes a generar: " #impresion de msj

read num_img                                       #usuario define cantidad de img
cuenta=0
cuenta_nom=1

existe_csv=./dict.csv #creo una variable con la ruta el archivo para confirmar si existe

if [ -f $existe_csv ]
then
   echo "El archivo $existe_csv existe"  #esto se comenta
else
   echo "El archivo $existe_csv no existe" #esto se comenta
   wget https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv #si no existe lo baja
fi

#nombres=$(cat dict.csv)

# cat del csv | TRANSLATE-SQUEEZE: espacios por _ | egrep "palabras" | tr "dejo todo en minuscula" | ordena random toda la lista de nombres | 
#devuelve las lineas que les pidas

cat dict.csv | tr " " "_" | tr "," "\n" | egrep "[A-Za-z]" | tr [:upper:] [:lower:] | sort -R | head -n $num_img > nombres_random.txt

#chmod +x nombres_random.txt

while [ $cuenta -lt $num_img ]                 #bucle determinado por numero ingresado, guarda una imagen en una carpeta determinada ./img en cada vuelta.
do                                             #la cuenta sirve para darle otro nombre a cada archivo.(hasta que funcione lo del nombre random)
    nombre=$(cat nombres_random.txt | sed -n ${cuenta_nom}p)
    wget -P ./img https://thispersondoesnotexist.com/?$nombre.jpeg
    cuenta=$((cuenta + 1))
    cuenta_nom=$((cuenta_nom + 1))
    sleep 2
done

var=$(find ./img -type f | wc -l)   #creo una variable con la cantidad de files que hay dentro de la carpeta img
echo $var

du -sh ./img



for FILE in ./*.jpeg; do mv "$FILE" "$(echo "$FILE" | cut -c 12-)"; done

#aux=./img
#for FILE in *$(ls $aux); do 
#   cat sarasa=$aux$FILE mv "$FILE" "$(echo "$FILE" | cut -c 12-)"; done


#if (($var == $num_img))           #si esta variable es igual al numero de img creadas pasa a comprimir la carpeta. pero comprime cada archivo individualmente.
#then  
#    gzip -r ./img
#    du -sh ./img
#fi"""