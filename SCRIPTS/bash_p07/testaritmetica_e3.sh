#! /bin/bash

# No utilizar la estructura de control if. Sólo utilizar [ ], [[ ]], expr, (( )) y $(( )).
# Mostrar el estado de retorno de los comandos ( $? ) para saber si es verdadero (0) o falso (>0)

# Define las variables:
# num1=2
# num2=100

# Verifica si $num1 es mayor que $num2

[[ $num1 > $num2 ]];
	echo "$?"; #1
