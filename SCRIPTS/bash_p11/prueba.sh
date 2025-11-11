#! /bin/bash

# USUARIO:
echo "USUARIO: $1";
echo "*****************************************************************"

# PROCESOS EN EJECUCIÓN USUARIO:
wc=$(ps -u $1 --no-headers | wc -l);
echo "PROCESOS EN EJECUCIÓN USUARIO: $num_procesos";

# PROCESO MÁS ANTIGUO DEL USUARIO:
antiguo=$(ps -u $1 --sort=start_time -o comm --no-headers | head -n 1);
echo "PROCESO MÁS ANTIGUO DEL USUARIO: $antiguo";

# LISTADO DE LOS PROCESOS DEL USUARIO:
ps -u $1 -o comm --no-headers;

echo "*****************************************************************";

# N DIRECTORIOS DEL USUARIO:
directorios=$(find / -user $1 -type d 2>/dev/null | wc -l);
echo "DIRECTORIOS DEL USUARIO: $directorios"

# N FICHEROS DEL USUARIO:
ficheros=$(find / -user $1 -type f 2>/dev/null | wc -l);
echo "FICHEROS REGULARES DEL USUARIO: $ficheros";

# TAMAÑO OCUPADO EN DISCO POR FICHEROS REGULARES DEL USUARIO
total_tam=$(find / -user $1 -type f -printf "%s\n" 2>/dev/null | awk '{ suma += $1 } END { print suma }');
echo "TAMAÑO TOTAL FICHEROS USUARIO: $total_tam B";

# ARCHIVO MÁS GRANDE Y TAMAÑO
grande=$(find / -type f -user $1 -printf "%s %p\n" 2>/dev/null| sort -h | tail -n 1 | awk '{ print $2 }');
grande_tam=$(find / -type f -user $1 -printf "%s %p\n" 2>/dev/null| sort -h | tail -n 1 | awk '{ print $1 }');
echo "ARCHIVO MÁS GRANDE: ${grande}; TAMAÑO: $grande_tam B";

# ARCHIVO MÁS PEQUEÑO Y TAMAÑO
peque=$(find / -type f -user $1 -printf "%s %p\n" 2>/dev/null| sort -h | head -n 1 | awk '{ print $2 }');
peque_tam=$(find / -type f -user $1 -printf "%s %p\n" 2>/dev/null| sort -h | head -n 1 | awk '{ print $1 }');
echo "ARCHIVO MÁS PEQUEÑO: ${peque}; TAMAÑO: $peque_tam B";
