#! /bin/bash

echo "Nombre del script: $0'";
echo "";
echo "============ encolumnado ===================";

num=1;
for par in $@; do
	echo "El parámetro $num es: $par";
	((num++));
done

echo "";
echo "============ caracteres ====================";
num=1;
cont=0;
for par in $@; do
	echo "El parámetro $num contiene: ${#par} caracteres";
	((num++));
	((cont=$cont+${#par}));
done
echo "";
echo "============ resumen ===================";

echo "Todos los parámetros: $*";
echo "Número total de parámetros: $#";
echo "Número total de caracteres: $cont";
