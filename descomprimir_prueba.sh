#!/bin/bash
: """
• descomprimir.sh: Se debe poder indicar por argumento dos archivos (uno
con las imágenes comprimidas y otro con una suma de verificación). Si
ocurrió algún error se debe informar al usuario de lo contrario se procede
a descomprimir"""

# Verificar que se paso un argumento
if [ "$#" -ne 1 ]; then
        echo "ERROR: Se requiere un argumento"
        exit 1
fi

# Obtener los nombres de los archivos de entrada
archivo_comprimido=$1


# Verificar que existe el archivo
if [ ! -f "$archivo_comprimido" ]; then
        echo "Error: el archivo comprimido '$archivo_comprimido' no existe."
        exit 2
fi
