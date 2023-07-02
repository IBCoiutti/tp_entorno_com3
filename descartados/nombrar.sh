#!/bin/bash

hola=3
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

cat dict.csv | tr " " "_" | tr "," "\n" | egrep "[A-Za-z]" | tr [:upper:] [:lower:] | sort -R | head -n 20 > nombres_random.txt

chmod +x nombres_random.txt

cat nombres_random.txt | sed -n ${hola}p