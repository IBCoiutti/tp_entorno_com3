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
    unzip archivo.zip
else
    echo "Error: falta comprobacion de archvivos"
fi

#cat test.txt 

