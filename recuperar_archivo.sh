#!/bin/bash
: """
Recupera el archivo copleto.zip del contenedor
"""

if [ -f container_id.txt ];then
	containerid=$( cat container_id.txt | cut -c 1-4 )

	docker cp "$containerid":/completo.zip .
else
	echo "No existe el archivo container_id.txt"
fi
