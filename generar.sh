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

while [ $cuenta -lt $num_img ]                 #bucle determinado por numero ingresado, guarda una imagen en una carpeta determinada ./img en cada vuelta.
do                                             #la cuenta sirve para darle otro nombre a cada archivo.(hasta que funcione lo del nombre random)
    wget -P ./img https://thispersondoesnotexist.com/?person/$cuenta.jpeg
    cuenta=$((cuenta + 1))
    echo $cuenta
    sleep 2
done

var=$(find ./img -type f | wc -l)   #creo una variable con la cantidad de files que hay dentro de la carpeta img
echo $var

du -sh ./img

#if (($var == $num_img))           #si esta variable es igual al numero de img creadas pasa a comprimir la carpeta. pero comprime cada archivo individualmente.
#then  
#    gzip -r ./img
#    du -sh ./img
#fi"""