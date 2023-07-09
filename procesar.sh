#!/bin/bash
: """
• procesar.sh: Se deberán recortar las imágenes a una resolución de
512*512 con alguna utilidad como imagemagick. Solamente deben proce-
sarse aquellas imágenes que tengan nombres de personas válidos. Entién-
dase por nombres de personas válidos a cualquier combinación de palabras
que empiecen con un letra mayúscula y sigan por minúsculas."""

# Obtener la ruta completa de la carpeta 'img'
ruta_imagenes_descomprimidas="$PWD/imagenes_descomprimidas"

ruta_img="$ruta_imagenes_descomprimidas/img"

ruta_recortadas="img_recortadas"

# Verificar si la carpeta "img" existe en la ruta especificada
if [ -d "$ruta_img" ]; then

	if [ ! -d "$ruta_recortadas" ]; then
		mkdir "$ruta_recortadas"
	fi
	for archivo in "$ruta_img"/*
	do
		nombre_archivo="${archivo##*/}"
		if [[ $nombre_archivo =~ ^[A-Z] ]]; then

			convert "$archivo" -resize 512x512^ -gravity center -extent 512x512 "$ruta_recortadas/$nombre_archivo"

			echo "Imagen recortada: $nombre_archivo"
		fi
	done
else
	echo "La carpeta 'img' no se encuentra en la ubicaciòn esperada"
fi

exit 0
