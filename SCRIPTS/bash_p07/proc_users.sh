#! /bin/bash

# Comandos útlies: grep, wc. Otros comandos útiles: ps

# Escribe un script proc_users.sh:
# Argumentos: uno o más nombres de usuario
# Verificar el número de argumentos recibido: debe haber al menos un argumento
# Para cada usuario recibido, mostrar por pantalla el número de procesos
# que le pertenezcan. Si el usuario no existe, este se ignora.

if [[ $# -eq 0 ]]; then
	echo "Parámetros insuficientes";
	exit 1;
fi

for user in $@; do
	if (id $user > /dev/null 2>&1); then
		num_proc=$(ps -u $user | wc -l);
		num_proc=$((num_proc - 1));
		if [[ num_proc -lt 1 ]]; then
			echo "El usuario $user no tiene procesos activos";
		else
			echo "El usuario $user tiene $num_proc procesos";
		fi
	else
		echo "El usuario $user no es un usuario válido";
	fi
done
