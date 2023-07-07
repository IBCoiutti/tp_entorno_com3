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


ruta_img_procesadas="$PWD/img_recortadas"

list_nombres_img="list_nombres_img.txt"


if [ -d "$ruta_img_procesadas" ]; then
	if [ ! -d "$list_nombres_img" ]; then
		mkdir "$list_nombres_img"
	fi
	for archivo in "$ruta_img_procesadas"/*
	do
		nombre_archivo="${archivo##*/}"
else
	echo "La carpeta 'img_recortadas'no se encuentra en la ubicaciòn esperada "
fi

exit 0
