#! /bin/bash

# HECHO		$1	 -> Operación. Debe ser una de estas opciones (R,r,S,s,M,m,D,d)
# HECHO		$2..$n   -> Operadores.

# HECHO		En la división, $2 debe ser mayor que $3 [[$2 -gt $3]]
# HECHO		Mensaje de error ERROR + FIN
# HECHO		Número de parámetros insuficiente 				[[ $# -lt 3 ]] ( menor que )
# HECHO		Demasiados parámetros posicionales para resta y división 	[[ $# -gt 3 ]] ( mayor que )
# HECHO 	Parámetros de naturaleza incorrecta (no son números)
# HECHO 	$1 incorrecto ( case *) )
# HECHO		El dividendo no puede ser 0

# 	> NOTA:
# 	> shift desplaza una posición a la izquierda los parámetros posicionales
# 	> Así eliminamos $1, que contiene la operación, y operamos sólo con los números
#	> ${@:2} Son todos los parámetros posicionales apartir del segundo, incluido éste

########################### DEFINICIÓN DE FUNCIONES ############################

### FUNCIÓN DE ERROR ###

function ERROR() {
cat << EOF
USAGE:
	$0 S|s|M|m NUMERO...
	$0 D|d|R|r NUMERO NUMERO

EXAMPLES:
	$0 s 2 4 3
	$0 D 10 5
	$0 r 5 10

WRONG EXAMPLES:
	$0 d 10 20
	$0 r 5 3.2

EOF
exit;
}

### FUNCIÓN DE SUMA ###

function SUMA() {
	suma=0;

	shift;
	for i in $@; do
		(( suma=$suma+$i ));
	done;
	echo "La suma de todos los números es $suma";
}

### FUNCIÓN DE RESTA ###

function RESTA() {
	result=$(($2-$3));
	echo "La resta de estos dos números es $result";
}

### FUNCIÓN DE MULTIPLICACIÓN ###

function MULTI() {
	multi=1;

	shift;
	for i in $@; do
		(( multi=$multi*$i ));
	done;
	echo "La multiplicación de todos los números es $multi";
}

### FUNCIÓN DE DIVISIÓN ###

function DIVISION() {
	result=$(( $2/$3 ));
	echo "El cociente de esta división es $result";
}

########################### EJECUCIÓN DEL SCRIPT ############################

for num in "${@:2}"; do
	if ! [[ $num =~ ^[[:digit:]]+$ ]]; then
		echo "Alguno de los operadores no es un número.";
		ERROR;
	fi
done

if [[ $# -lt 3 ]]; then
	echo "Parámetros insuficientes. Al menos 2 operadores necesarios."
	ERROR;
else

	case "$1" in
		M|m)
			MULTI $@;
		;;
		S|s)
			SUMA $@;
		;;
		R|r)
			if [[ $# -gt 3 ]]; then
				echo "Demasiados parámetros para esta operación.";
				ERROR;
			else
				RESTA $@;
			fi
		;;
		D|d)
			if [[ $# -gt 3 ]]; then
				echo "Demasiados parámetros para esta operación.";
				ERROR;
			elif [[ $2 -lt $3 ]]; then
				echo "El dividor debe ser mayor que el dividendo.";
				ERROR;
			elif [[ $3 -eq 0 ]]; then
				echo "El dividendo no puede ser 0. Error sintáctico.";
				ERROR;
			else
				DIVISION $@;
			fi
		;;
		*)
			echo "Parámetro 1 no válido. Debe ser uno de los siguientes:"
			ERROR;
		;;
	esac
fi
