#! /bin/bash

# Si se llama sin parámetros o con más parámetros de los obligatorios o parámetros incorrectos,
# Se llama a una función de error que muestra cómo debe utilizarse el script correctamente

# OPCIONES
# -verbose (opcional)
# Si se usa, debe mostrar por salida:
## ruta_absoluta_fichero : numero_de_linea_donde_aparece : aparicion

# Si se usa sin verbose:
## ruta_absoluta_fichero : numero_de_linea_donde_aparece
### USAR COMANDO GREP PARA ESTO ^

# palabra_reservada (obligatoria)
# Cualquiera de éstas:
## case do done elif else esac fi for function if in select then until while time

# Synopsis:
## reservator [-verbose] palabra_reservada


## FUNCION DE ERRROR ##

function ERROR() {
cat << EOF
USAGE:
	$0 [-verbose] palabra_reservada
	palabra_reservada: case do done elif else esac fi for function if in select then until while time
EOF
exit 1;
}

## FUNCION VERBOSE ##
function VERBOSE() {
	echo "Verbose activado con palabra reservada: $1"
	exit;
}

## FUNCION RESERVADA ##
function RESERVADA() {
	echo "Palabra reservada: $1"
	exit;
}


if [[ $1 == "-verbose" ]]; then
	case $2 in

	  case | do | done | elif | else | esac | fi | for | function | if | in | select | then | until | while | time)
		VERBOSE $2;
	  ;;

	  "")
		echo "Debes introducir una palabra reservada.";
		ERROR;
	  ;;

	  *)
		echo "$2 no es una de las palabras reservadas.";
		ERROR;
	  esac
else
	case $1 in

	  case | do | done | elif | else | esac | fi | for | function | if | in | select | then | until | while | time)
		RESERVADA $1;
	  ;;

	  "")
		echo "Debes introducir una palabra reservada.";
		ERROR;
	  ;;

	  *)
		echo "$1 no es una de las palabras reservadas.";
		ERROR;
	  esac
fi
