#!/bin/bash

# Ejercicio 1: Funciones simples
# Comandos útiles: df, who

# Escribe un script audit.sh
#	Escribe una función users_connect que mostrará la lista de los usuarios conectados actualmente.
#	Escribe una función disk_space que mostrará el espacio en disco disponible.
#	El programa principal mostrará el siguiente menú:

# - 0 - Fin
# - 1 - Mostrar la lista de usuarios conectados
# - 2 - Mostrar el espacio en disco
# Su opción:

#	Introducir la opción del usuario y llamar a la función adecuada.

function users_connect() {
	echo "================================================================";
	echo "Información de usuarios conectados al sistema actualmente:";
	who -H;
exit 0;
}

function disk_space() {
	# disponible=$(df -h --output=avail / | tail -n1); Otra forma de hacerlo, pero almacena unos espacios delante del valor molestos
	disponible=$(df -h / | tail -n1 | awk '{print $3}');
	echo "================================================================";
	echo "El espacio disponible en disco es de $disponible";
exit 0;
}

cat << EOF
- 0 - Fin
- 1 - Mostrar la lista de usuarios conectados
- 2 - Mostrar el espacio en disco
EOF

read -p "Su opción: " opt;

case $opt in
	0)
		exit 0;
	;;

	1)
		users_connect;
	;;

	2)
		disk_space;
	;;

	*)
		echo "Opción no válida";
esac
