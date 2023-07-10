#!/bin/bash
: """
• menu.sh: Debe incluirse un menú para elegir cada una de las opciones
anteriores."""

clear
# Funciòn para mostrar el menù y solicitar una opciòn al usuario
mostrar_menu() {
	echo "              "
	echo "==== MENÙ ===="
	echo "1. Generador de imagenes."
	echo "2. Descomprimir imagenes."
	echo "3. Procesar y recortar imagenes."
	echo "4. Comprimir archivos"
	echo "5. Limpiar pantalla"
	echo "6. Exit"
	echo "=============="
	echo "              "

	read -p "Seleccione una opcion: " opcion
	echo "              "
}

# Funciòn para ejecutar el script seleccionado



ejecutar_script() {

	case $opcion in
		1)
			# Ejecutar script 1
			./generar.sh
			;;
		2)
			# Ejecutar script 2
			./descomprimir.sh
			;;
		3)
			# Ejecutar script 3
			./procesar.sh
			;;
		4)
			# Ejecutar script 4
			./comprimir.sh
			;;
		5)
			# Limpiar la pantalla
			clear
			;;
		6)
			# Salir del menù
			exit 1
			;;
		777)
			# Salir del menù
			bash
			;;
		*)
			# Opciòn invàlida
			echo "Opciòn invàlida. Intente nuevamente."
			;;
	esac
}

# Bucle principal del menù
while true; do
	mostrar_menu
	ejecutar_script
done


exit 0
