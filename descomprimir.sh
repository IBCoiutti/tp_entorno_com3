#!/bin/bash
: """
• descomprimir.sh: Se debe poder indicar por argumento dos archivos (uno
con las imágenes comprimidas y otro con una suma de verificación). Si
ocurrió algún error se debe informar al usuario de lo contrario se procede
a descomprimir"""

# Ingresa y lee ambos argumentos
echo "Ingrese archivo para descomprimir: "
read archivo_comp
echo "Ingrese archivo de suma de verificacion: "
read verf

# Si los argumentos no existen o no se ingresan pasa directamente
if [ ! -f "$archivo_comp" ] || [ ! -f "$verf" ]; then
	echo "Error: No ingreso o no existen la suma de verificacion y el archivo."
else
	echo "suma de verificacion"
	md5sum -c "$verf"
	mkdir -p imagenes_descomprimidas
        unzip "$archivo_comp" -d imagenes_descomprimidas

        echo "Se descomprimio correctamente el archivo '$archivo_comp'."
	exit 1
fi

# Si no se pasan argumentos utiliza el archivo.zip y la suma de verificaciones test.txt
existe_test=./test.txt
archivo_comprimido=./archivo.zip
echo "Faltaron argumentos, se descomprime el archivo '$archivo_comprimido'."

# Verifica que existe el archivo archivo.zip.
if [ ! -f "$archivo_comprimido" ]; then
	echo "Error: el archivo comprimido '$archivo_comprimido' no existe. Es necesario generar las imagenes antes de descomprimirlas."
	exit 2
fi

md5sum "$archivo_comprimido" >> test.txt

# Verifica que existe  la suma de verificaciones guardada en test.txt
if [ ! -f "$existe_test" ]; then
	echo "No existe la suma de verificacion '$test.txt'."
	exit 3
fi

test1=$(cat test.txt | sed -n 1p | cut -c 1-32 )
test2=$(cat test.txt | sed -n 2p | cut -c 1-32 )


#echo $test1
#echo $test2

# Compara las sumas de verificaciones
if [ $test1 == $test2 ];
then

	# Descomprime las imagenes y las guardar en el directorio imagenes_descomprimidas
	mkdir -p imagenes_descomprimidas
	unzip "$archivo_comprimido" -d imagenes_descomprimidas

	echo "Se descomprimio correctamente. Se guardaron las imagenes en el directorio imagenes_descomprimidas"
else
	echo "Error: el archivo esta dañado."
fi

exit 0

