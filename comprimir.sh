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

# Ruta al directorio list_nombres
dir_nom="./list_nombres"

# Si no existe crea el directorio list_nombres
if [ ! -d dir_nom ]; then
	mkdir list_nombres
fi

# Confirma la existencia del directorio img_recortadas. Si no existe da error
if [ -d "$PWD/img_recortadas" ]; then
	# Guarda la lista de nombres validos en un archivo de texto dentro del directorio list_nombres
	ls -p "$PWD/img_recortadas" | grep -E '[jpeg]$' |  sed 's/\.jpeg$//' > "$PWD/list_nombres/list_nombres_validos.txt"
else 
	echo "ERROR: no existe el directorio 'img_recortadas'. Debe procesar las imagenes antes de comprimir."
	exit 1
fi

# Confirma la existencia del directorio img dentro de imagenes_descomprimidas.
if [ -d "$PWD/imagenes_descomprimidas/img" ]; then
	# Guarda una lista de todos los nombres da las imagenes en un archivo de texto dentro del directorio list_nombres
	ls -p "$PWD/imagenes_descomprimidas/img" | grep -E '[jpeg]$' | sed 's/\.jpeg$//' > "$PWD/list_nombres/list_todas_img.txt"
	# Guarda una lista de todos los nombres terminados en a de las imagenes en un archivo de texto dentro del directorio list_nombres
	ls -p "$PWD/imagenes_descomprimidas/img" | grep -E '[jpeg]$' | sed 's/\.jpeg$//' | grep -E '[a]$' > "$PWD/list_nombres/list_personas_a.txt "
else 
	echo "ERROR: no existe el directorio 'imagenes_descomprimidas'"
	exit 2
fi

zip -r ./archivo_comprimido/completo.zip ./img ./list_nombres


exit 0
