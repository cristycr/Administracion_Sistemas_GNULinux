#!/bin/bash

# Ejercicio 5: archivos, funciones, menú select

# Lee el fichero alumnos.txt
# Escribe el script  stats_select.sh:
#	Permite mostrar los registros de cada Clase.
#	Permite calcular el promedio de cada Clase.

# El script muestra un menú escrito con la estructura select.

# 1) Extracto por clase
# 2) Promedio por clase
# 3) Fin

fichero="alumnos.txt";

function REGISTROS() {
	read -p "Clase ? " clase

	grep "|$clase|" "$fichero" |
	while read linea; do
		nom=$(printf "%s" "$linea" | cut -d"|" -f1);
		cla=$(printf "%s" "$linea" | cut -d"|" -f2);
		not=$(printf "%s" "$linea" | cut -d"|" -f3);

		printf "%-12s %-6s %-5s\n" "$nom" "$cla" "$not";
	done
};

function PROMEDIO() {
	read -p "Clase ? " clase;

	total=0;
	conta=0;

	while read linea; do
		nota=$(printf "%s" "$linea" | cut -d"|" -f3);

		printf "Nota : %s\n" "$nota";
		total=$(( total + nota ));
		conta=$(( conta + 1 ));
	done < <(grep "|$clase|" "$fichero");

	if [[ conta -gt 0 ]]; then
		prome=$(( total / conta ));
		echo "Promedio de la clase de $clase: $prome";
	else
		echo "No hay información de la clase $clase";
	fi
};

PS3="Su opcion: ";

select opt in "Extracto por clase" "Promedio por clase" "Fin"; do
	case $REPLY in
		1)
			REGISTROS;
		;;
		2)
			PROMEDIO;
		;;
		3)
			exit 0;
		;;
		*)
			echo "Opción no válida";
		;;
	esac
done
