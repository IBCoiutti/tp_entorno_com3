#!/bin/bash

echo "Introduce el numero de imagenes a generar: "

read num_img
cuenta=0

while [ $cuenta -lt $num_img ]
do
    cuenta=$((cuenta + 1))
    echo $cuenta
done