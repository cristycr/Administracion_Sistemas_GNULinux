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

SYNOPSIS:
	$0 [-verbose] palabra_reservada

DESCRIPTION:
	Busca en todos los ficheros contenidos en /etc/ y que respondan al tipo shell script
	(de cualquiera de sus clases) la aparición de palabra_reservada como palabra aislada
	(no como subcadena). Si se llama en vacío, con más parámetros de los obligatorios o
	con parámetros incorrectos, presentará por la salida estandard un texto explicativo
	de cómo se usa el script y finaliza.

========================================================================================

	palabra_reservada:
	case | do | done | elif | else | esac | fi | for | function | if | in | select | then | until | while | time

EXAMPLE:
	$0 case
	$0 -verbose function
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
	if [[ $# -eq 2 ]]; then
		case $2 in
	  	  case | do | done | elif | else | esac | fi | for | function | if | in | select | then | until | while | time)
			VERBOSE $2;
	  	  ;;

	  	  *)
			echo "$2 no es una de las palabras reservadas.";
			ERROR;
	  	  esac
	else
		echo "Debes introducir una palabra reservada como mínimo y máximo.";
		ERROR;
	fi
else
	if [[ $# -eq 1 ]]; then
		case $1 in

	  	  case | do | done | elif | else | esac | fi | for | function | if | in | select | then | until | while | time)
			RESERVADA $1;
	  	  ;;

	  	  *)
			echo "$1 no es una de las palabras reservadas.";
			ERROR;
	  	  esac
	else
		echo "Debes introducir una palabra reservada como mínimo y máximo.";
		ERROR;
	fi
fi
