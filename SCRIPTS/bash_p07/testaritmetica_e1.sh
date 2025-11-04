#! /bin/bash

# No utilizar la estructura de control if. Sólo utilizar [ ], [[ ]], expr, (( )) y $(( )).
# Mostrar el estado de retorno de los comandos ( $? ) para saber si es verdadero (0) o falso (>0)

# 1. Verifica si el archivo (o directorio) /etc existe.
# 2. Verifica si es posible acceder al archivo /etC/hosts en lectura.
# 3. Verifica si el archivo /etc/hosts es ejecutable.
# 4. Verifica si el archivo /usr es un directorio y si se puede atravesar.
# 5. Verifica si el archivo /dev/null es un archivo especial de dispositivo.

[[ -e /etc ]];
	echo "$?"; # 0

[[ -r /etc/hosts ]];
	echo "$?"; # 0

[[ -x /etc/hosts ]];
	echo "$?"; # 1

[[ -d /usr && -x /usr ]];
	echo "$?"; # 0

# [[ ! -d /dev/null && ! -f /dev/null ]] También se puede comprobar así
[[ -b /dev/null || -c /dev/null || -s /dev/null || -p /dev/null ]];
	echo "$?"; # 0
