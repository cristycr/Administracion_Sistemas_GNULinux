#! /bin/bash

# No utilizar la estructura de control if. Sólo utilizar [ ], [[ ]], expr, (( )) y $(( )).
# Mostrar el estado de retorno de los comandos ( $? ) para saber si es verdadero (0) o falso (>0)

# Define las variables:
# num1=3
# num2=5

# 1. Inicializa una variable 'res' con la suma de 'num1' y 'num2'. Muestra 'res'.
# 2. Sin inicializar la variable 'res', muestra por pantalla la suma de dos números. Proporcione a su vez las dos soluciones.
# 3. Inicialice una variable 'res' con el resultado de la multiplicación de 'num1' y 'num2'. Muestre 'res'

num1=3;
num2=5;

# 1.
res=$((num1+num2));
	echo $res;

# 2.
echo $((num1+num2));

# 3.
res=$((num1*num2));
	echo $res;
