#!/bin/bash

# Haciendo uso de estructura de control case, bucle for

# Debe tomar por argumentos posicionales cadenas de caracteres que representen nombres de archivos (existan o no)
# Si el nombre termina en .doc o .pdf (sólo minúsculas), muestra un mensaje
# Si no, muestra "Ni DOC, ni PDF". El nombre del archivo puede contener más de un caracter punto

for param in $@; do
	case $param in
	*.doc)
		echo "$param: Archivo DOC";
	;;

	*.pdf)
		echo "$param: Archivo PDF";
	;;

	*)
		echo "$param: Ni DOC, ni PDF";
	;;
	esac
done
