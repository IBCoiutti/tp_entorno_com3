#!/bin/bash
: """
• comprimir.sh: Finalmente, luego de procesadas las imágenes, se debe:
– generar un archivo con la lista de nombres de todas las imágenes.
– generar un archivo con la lista de nombres válidos.
– generar un archivo con el total de personas cuyo nombre finaliza con
la letra a.
– por último, generar un archivo comprimido que incluya los archivos
generados en los items anteriores y todas las imágenes. El archivo
comprimido debe poder accederse desde fuera del contenedor."""


dir_nom="./list_nombres"

if [ -d dir_nom ]; then
	echo "existe"
else
	mkdir list_nombres
fi


if [ -d "$PWD/img_recortadas" ]; then
	ls -p "$PWD/img_recortadas" | grep -E '[jpeg]$' |  sed 's/\.jpeg$//' > "$PWD/list_nombres/list_nombres_validos.txt"
else 
	echo "ERROR: no existe el directorio 'img_recortadas'"
	exit 1
fi
if [ -d "$PWD/imagenes_descomprimidas/img" ]; then
	ls -p "$PWD/imagenes_descomprimidas/img" | grep -E '[jpeg]$' | sed 's/\.jpeg$//' > "$PWD/list_nombres/list_todas_img.txt"
	ls -p "$PWD/imagenes_descomprimidas/img" | grep -E '[jpeg]$' | sed 's/\.jpeg$//' | grep -E '[a]$' > "$PWD/list_nombres/list_personas_a.txt "
else 
	echo "ERROR: no existe el directorio 'imagenes_descomprimidas'"
	exit 2
fi


exit 0
