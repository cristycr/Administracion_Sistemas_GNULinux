#!/bin/bash

# Ejercicio 3: paso de parámetros, retorno de valor

# Escribe un script calcul.sh que tendrá:

# Una función esNum que recibe un valor como argumento y que retorna verdadero si el valor
# es un número entero y falso en el caso contrario. Si define variables, éstas deberán ser locales.

# Una función suma que recibe un número cualquiera de parámetros. La función debe verificar,
# empleando la función esNum, que los argumentos recibidos son números y mostrar la suma de los
# argumentos. Si uno de los argumentos es incorrecto, este será ignorado. Si emplea variables,
# deberán ser locales.

# Una función producto que recibe un número cualquiera de parámetros. Verifica igual que la
# función suma.

# El programa princial:
# Recibirá como argumentos la opreación que se ha de realizar, al igual que una serie de números.

function esNum() {
	shift;
	for num in $@; do
		if ! [[ $num == +([[:digit:]]) ]]; then
			echo "El '$num' no es un número entero.";
			exit 1;
		fi
	done
}

function producto() {
	esNum $@;
	multi=1;

	shift;
	for num in $@; do
		multi=$(( multi*num ));
	done
	echo "$multi";
exit 0;
};

function suma() {
	esNum $@;
	suma=0;

	shift;
	for num in $@; do
		suma=$(( suma+num ));
	done
	echo "$suma";
exit 0;
};


if [[ $1 == producto ]]; then
	producto $@;
elif [[ $1 == suma ]]; then
	suma $@;
else
	echo "Debes especificar qué operación deseas hacer.";
	echo "SINTAXIS: $0 [producto|suma] [numero...]";
fi
