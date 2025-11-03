#!/bin/bash

# Comandos de filtro útiles: tr. Otros comandos útiles: mv

# 1. Argumento opcional: un nombre de directorio. El valor por defecto será el directorio actual
# 2. Verificar que el posible argumento sea un directorio
# 3. Renombrar los archivos del directorio: los nombres de archivo en mayúsculas serán convertidos a minúsculas

function CAMBIAR() {
	minus=$()
	exit;
}

function CAMBIARDEF() {
	for arch in *; do
		minus=$(echo "$arch" | tr '[:upper:]' '[:lower:]')
		if [[ "$arch" != "$minus" ]]; then
			mv "$arch" "$minus";
		fi
	done
}

case "$1" in
	*) # No está vacía
		CAMBIAR $1;
	;;
	"") # Está vacía
		CAMBIARDEF;
	;;
esac

