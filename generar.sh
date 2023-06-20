#!/bin/bash
: """• generar.sh: Genera imágenes utilizando algún servicios web. 
 Se debe poder indicar por argumento cuantas imagenes generar y se deben asignar
nombres de archivo al azar de una lista de nombres de personas.
 Tener en cuenta que al descargar de una página conviene usar un sleep entre
descarga y descarga para no saturar el servicio y evitar problemas. 
 Luego se deben comprimir las imágenes, y generar un archivo con su suma de
verificación."""

echo "Introduce el numero de imagenes a generar: "

read num_img
cuenta=0

while [ $cuenta -lt $num_img ]
do
    wget -P ./img https://source.unsplash.com/random/900%C3%97700/?person/$cuenta.jpeg
    cuenta=$((cuenta + 1))
    echo $cuenta
done

#wget -c https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv

