#! /bin/bash

function ERROR() {
cat << EOF

Para conocer el uso del comando espejo.sh, lea la siguiente página de manual.

NOMBRE
	$0 - Produce un fichero de nombre /var/tmp/$USER.mirror, el cual contiene el nombre
	de cada uno de los ficheros regulares ubicados por debajo del directorio dado (a
	cualquier profundidad) junto con su espejado.
	Cada línea del fichero seguirá el siguiente formato:
	fichero:orehcif

SINÓPSIS
	$0 directorio_de_trabajo

EOF
exit;
}

# CREAR EL FICHERO $USER.mirror
touch /var/tmp/$USER.mirror 2>/dev/null;

# FUNCION ESPEJADO
function ESPEJADO() {
echo "Entrando a la función ESPEJADO.";
ficheros=( $(find $1 -type f -printf "%f\n") );

for fichero in ${ficheros[@]}; do
	long=${#fichero};
	unset espejado;

	for (( i=$long; i>=0; i-- )); do
		espejado+=${fichero:$i:1};
	done
	echo "$fichero:$espejado" >> /var/tmp/$USER.mirror_unordered;
done

# ORDENAR EL FICHERO DESORDENADO Y METERLO EN EL FICHERO $USER.mirror
sort /var/tmp/$USER.mirror_unordered > /var/tmp/$USER.mirror;
rm /var/tmp/$USER.mirror_unordered 2>/dev/null;

echo "El fichero espejados se ha creado con éxito.";
exit 0;
}

if [[ $# -gt 1 ]]; then
	echo "Demasiados parámetros.";
	ERROR;
elif [[ $# -lt 1 ]]; then
	echo "Parametros insuficientes.";
	ERROR;
fi

if ! [[ -e $1 ]]; then
	echo "$1 No existe.";
	ERROR;
fi

if [[ -e $1 && -d $1 ]]; then
	ESPEJADO $1;
elif ! [[ -d $1 ]]; then
	echo "$1 No es un directorio.";
	ERROR;
fi
