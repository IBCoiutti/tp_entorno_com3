#!/bin/bash
: """
Recupera el archivo copleto.zip del contenedor
"""

# confirma si existe el archivo container_id.txt
if [ -f container_id.txt ];then
	# Guarda las primeras cuatro letras del contenido del archivo de texto en la variable containerid
	containerid=$( cat container_id.txt | cut -c 1-4 )

	# Traes desde el docker el archivo completo.zip
	docker cp "$containerid":/completo.zip .
else
	echo "No existe el archivo container_id.txt"
fi
