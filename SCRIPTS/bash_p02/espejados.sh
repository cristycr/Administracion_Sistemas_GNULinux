#! /bin/bash

function ERROR() {
cat << EOF

Mensaje de error

EOF
exit;
}

rm /var/tmp/${USER}.mirror 2>/dev/null;
touch /var/tmp/${USER}.mirror;

function ESPEJADO() {
	# Si ha llegado a este punto, es un directorio y existe
	FICHEROS=( $(find $1 -type f -printf "%f\n") );

	for fichero in ${FICHEROS[@]}; do
		unset espejado;
		long=${#fichero};
		for (( i=long; i >= 0; i-- )); do
			espejado+="${fichero:$i:1}";
		done
		echo "$fichero:$espejado" >> /var/tmp/${USER}.mirror1;
	done
	sort /var/tmp/${USER}.mirror1 > /var/tmp/${USER}.mirror;
	rm /var/tmp/${USER}.mirror1;
exit;
}

if [[ -e $1 && -d $1 ]]; then
	ESPEJADO $1;
elif [[ -f $1 ]]; then
	echo "$1 es un fichero. Debe introducir un direccionamiento relativo o absoluto de un directorio.";
	ERROR;
elif ! [[ -e $1 ]]; then
	echo "$1 no existe. Debe introducir un direccionamiento relativo o absoluto de un directorio.";
	ERROR;
fi
