#! /bin/bash

# No utilizar la estructura de control if. Sólo utilizar [ ], [[ ]], expr, (( )) y $(( )).
# Mostrar el estado de retorno de los comandos ( $? ) para saber si es verdadero (0) o falso (>0)

# Define estas variables:
# s1=si
# s2=no
# vacia=""
# arch1=informe.pdf

# 1.Prueba si $s1 es igual a $s2
# 2.Prueba si $s1 es diferente a $s2
# 3.Prueba si $vacia está vacía
# 4.Prueba si $vacia no está vacía
# 5.Prueba si $arch1 termina en .doc
# 6.Prueba si $arch1 termina en .doc o en .pdf

s1="si";
s2="no";
vacia="";
arch1="informe.pdf"

[[ $s1 == $s2 ]];
	echo "$?"; #1

[[ $s1 != $s2 ]];
	echo "$?"; #0

[[ -z $vacia ]];
	echo "$?"; #0

[[ -s $vacia ]];
	echo "$?"; #1

[[ $arch1 == *.doc ]];
	echo "$?"; #1

[[ $arch1 == *.doc || $arch1 == *.pdf ]];
	echo "$?"; #0
