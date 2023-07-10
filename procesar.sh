#!/bin/bash
: """
• procesar.sh: Se deberán recortar las imágenes a una resolución de
512*512 con alguna utilidad como imagemagick. Solamente deben proce-
sarse aquellas imágenes que tengan nombres de personas válidos. Entién-
dase por nombres de personas válidos a cualquier combinación de palabras
que empiecen con un letra mayúscula y sigan por minúsculas."""

# Obtener la ruta completa de la carpeta imagenes_descomprimidas
ruta_imagenes_descomprimidas="$PWD/imagenes_descomprimidas"

# Obtener la ruta completa de la carpeta img"
ruta_img="$ruta_imagenes_descomprimidas/img"

# Obtener la ruta a la carpeta img_recortadas"
ruta_recortadas="img_recortadas"

# Verificar si la carpeta img existe en la ruta especificada
if [ -d "$ruta_img" ]; then

	# Verificar si la carpeta img_recortadas existe. Si no la crea
	if [ ! -d "$ruta_recortadas" ]; then
		mkdir "$ruta_recortadas"
	fi
	# for para pasar por los archivos que se encuentran en la carpeta img_recortadas
	for archivo in "$ruta_img"/*
	do
		#  variable que toma el nombre del archivo dentro de la carpeta img_recortadas
		nombre_archivo="${archivo##*/}"
		# si el nombre empieza con mayuscula entonces recorta la imagen
		if [[ $nombre_archivo =~ ^[A-Z] ]]; then

			convert "$archivo" -resize 512x512^ -gravity center -extent 512x512 "$ruta_recortadas/$nombre_archivo"

			echo "Imagen recortada: $nombre_archivo"
		else
			echo "La imagen '$nombre_archivo' no tiene nombre de persona valido."
		fi
	done
else
	echo "La carpeta 'img' no existe. Asegurese de descomprimir las imagenes antes de procesarlas."
fi

exit 0
