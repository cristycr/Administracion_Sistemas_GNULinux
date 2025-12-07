#! /bin/bash

# Crea un script que muestre por la salida estándar el árbol de subdirectorios contenidos en el
# directorio pasado como parámetro posicional con direccionamiento absoluto. Si además del
# directorio se le pasa el modificador -f (siempre antes del directorio, en otro caso aborta la
# ejecución informando), mostrará también los ficheros, marcando con el caracter "+" los
# directorios y con el caracter "-" todo lo que no sea directorio. Al pie de la estructura
# mostrará una línea con el total de directorios visualizados y otra línea con el total de ficheros
# regulares visualizados.

# Se debe verificar que los parámetros posicionales cumplen las condiciones enunciadas, a saber, el
# directorio debe ser dado con direccionamiento absoluto y debe existir. En caso de ser dos
# parámetros posicionales, cada uno debe corresponder con lo que se espera. Obligatoriamente uno
# o dos parámetros posicionales, cualquier otro número de ellos o ninguno genera un aviso de error
# y acaba el script.

function ERROR() {
cat << EOF
HA HABIDO UN ERROR
EOF
exit 1;
}

function FILES() {
	find $1 -mindepth 1 -printf "%d %y %f\n" \
	| awk '{
		tabulacion = ($1 - 1)*4
		simbolo = ($2 == "d" ? "+" : "-")

		printf "%*s%s %s\n", tabulacion, "", simbolo, $3

		if($2 == "d") dirs++
		else if($2 == "f") fich++

		} END {
		print "Total directorios:", dirs
		print "Total ficheros regulares:", fich
		}';
	exit 0;
}

function TREE() {
	find $1 -mindepth 1 -type d -printf "%d %f\n" \
	| awk '{
		tabulacion = ($1 - 1)*4
		printf "%*s%s\n", tabulacion, "", $2 }';
	exit 0;
}

if [[ ${#@} -lt 1 ]]; then
	echo "Parámetros insuficientes.";
	ERROR;
elif [[ ${#@} -gt 2 ]]; then
	echo "Demasiados parámetros posicionales.";
	ERROR;
elif [[ $1 == "-f" ]]; then
	if [[ ${#@} -eq 1 ]]; then
		echo "Falta el directorio.";
		ERROR;
	elif [[ -d $2 && $2 == /* ]]; then
		FILES $2;
	else
		echo "$2 no es un direccionamiento absoluto o no existe.";
		ERROR;
	fi;
elif [[ -d $1 && $1 == /* ]]; then
	if [[ ${#@} -eq 1 ]]; then
		TREE $1;
	else
		echo "Demasiado parámetros posicionales.";
		ERROR;
	fi;
elif ! [[ -d $1 && $1 == /* ]]; then
	echo "$1 no es un direccionamiento absoluto o no existe.";
	ERROR;
fi;
