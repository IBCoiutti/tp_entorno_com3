#!/bin/bash
: """
• descomprimir.sh: Se debe poder indicar por argumento dos archivos (uno
con las imágenes comprimidas y otro con una suma de verificación). Si
ocurrió algún error se debe informar al usuario de lo contrario se procede
a descomprimir"""

existe_test=./test.txt

test1=$(cat test.txt | sed -n 2p | cut -c 1-32 )
test2=$(cat test.txt | sed -n 4p | cut -c 1-32 )

echo $test1
echo $test2

if [ $test1 == $test2 ] && [ -f $existe_test ]
then

	# Verificar que se paso un argumento
	if [ "$#" -ne 1 ]; then
        	echo "ERROR: Se requieren un argumento"
	        exit 1
	fi

	# Obtener los nombres de los archivos de entrada
	archivo_comprimido=$1

	# Verificar que existe el archivo
	if [ ! -f "$archivo_comprimido" ]; then
        	echo "Error: el archivo comprimido '$archivo_comprimido' no existe."
	        exit 2
	fi

	# Descomprimir las imagenes y guardar en un directorio
	mkdir -p imagenes_descomprimidas
	unzip "$archivo_comprimido" -d imagenes_descomprimidas

	echo "Se descomprimio correctamente"

fi
exit 0

