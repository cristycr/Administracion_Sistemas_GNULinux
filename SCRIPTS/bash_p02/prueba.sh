#!/bin/bash

# Palabras reservadas
reservadas=("start" "stop" "status" "restart")

# Variable para activar modo verbose
verbose=false

# --- Sección de parseo de opciones ---
while getopts ":v" opt; do
  case $opt in
    v)
      verbose=true
      ;;
    \?)
      echo "Opción inválida: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Quitamos las opciones ya procesadas
shift $((OPTIND -1))

# --- Aquí empieza la lógica del script ---
comando=$1

if [[ " ${reservadas[*]} " == *" $comando "* ]]; then
  if $verbose; then
    echo "Modo verbose activado"
  fi
  echo "Ejecutando comando: $comando"
else
  echo "Error: '$comando' no es una palabra reservada"
  exit 1
fi

