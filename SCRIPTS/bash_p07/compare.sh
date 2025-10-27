#!/bin/bash

# Haciendo uso de [ ] y [[ ]], y la estructura de control IF:

# Debe recibir dos argumentos: dos nombres de archivos ordinarios
# Verificar que el número de argumentos es igual a 2 y que los archivos son de tipo ordinario
# Si los argumentos son correctos, el script deberá decir si los dos archivos son del mismo tamaño;
# en caso contrario, deberá decir cuál es el mayor de los dos.

if [[ $# -eq 2 ]]; then
	if [[ -e $1 && -e $2 && -f $1 && -f $2 ]]; then

		tam1=$(stat -c %s $1);
		tam2=$(stat -c %s $2);

		if [[ $tam1 -gt $tam2 ]]; then
			echo "El fichero $1 es el de mayor tamaño de los dos. Tamaño --> $tam1 bytes";
		elif [[ $tam2 -gt $tam1 ]]; then
			echo "El fichero $2 es el de mayor tamaño de los dos. Tamaño --> $tam2 bytes";
		else
			echo "Los ficheros tienen el mismo tamaño";
		fi
	else
		echo "Uno o ambos ficheros no existen o no son ficheros ordinarios"
	fi
elif [[ $# -gt 2 ]]; then
	echo "Demasiados parámetros. Introduce sólo 2.";
else
	echo "Parámetros insuficientes. Se necesitan 2.";
fi
