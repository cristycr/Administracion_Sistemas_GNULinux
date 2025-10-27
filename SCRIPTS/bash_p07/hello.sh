#! /bin/bash

# Solicita al usuario la introducción de su nombre y almacénalo en una variable
# Solicita al usuario la introducción de su apellido y almacénalo en otra variable
# Muestra un mensaje de bienvenida al usuario con estos datos
# Muestra el PID de la shell que ejecuta el script

read -p "Introduce tu nombre: " name;
read -p "Introduce tu apellido: " surname;

echo "Buenos días $name $surname";
echo "El PID de la shell es $BASHPID";
