#!/bin/bash

# Ejercicio 2: Funciones simples, valor de retorno
# Comandos filtro útiles: awk, tr -d. Otros comandos útiles: df, find

# Escribe un script llamado explore_sa.sh:
#	El programa principal mostrará este menú:

# - 0 - Fin
# - 1 - Mostrar la lista de usuarios conectados
# - 2 - Mostrar el espacio en disco
# Su opción:

#	Introduce la opción del usuario.
#	La opción 0 finaliza el script.
#	La opción 1 llama a la función limpieza.
#	La opción 2 llama a la función sin_espacio_d.
#	En función al valor retornado por la función, mostrar el mensaje adecuado.

function limpieza() {
	echo "================================================================";
	echo "Comenzando con la limpieza:";
	find ~ -size 0 -exec rm -ir {} \;
exit 0;
}

function sin_espacio_d() {
	tasa="NORMAL";
	espacio=$(df / | tail -n1 | awk '{print $5}' | cut -d% -f1);

	if [[ $espacio -gt 80 ]]; then
		tasa="ALTA";
	fi
	echo "================================================================";
	echo "Tasa de utilización del sistema de archivos raíz: $tasa";
exit 0;
}

cat << EOF
- 0 - Fin
- 1 - Eliminar los archivos de tamaño 0 de mi directorio principal
- 2 - Controlar el espacio del disco del SA raíz
EOF

read -p "Su opción: " opt;

case $opt in
	0)
		exit 0;
	;;

	1)
		limpieza;
	;;

	2)
		sin_espacio_d;
	;;

	*)
		echo "Opción no válida";
esac
