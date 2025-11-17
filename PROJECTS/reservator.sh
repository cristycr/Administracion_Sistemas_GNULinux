#! /bin/bash

function ERROR() {
cat << EOF
Para conocer el uso del comando reservator, lea la siguiente página de manual.

NOMBRE
	$0 - Busca en todos los ficheros contenidos en /etc/ y que respondan al
	tipo shell script (de cualquiera de sus clases) la aparición de palabra_reservada
	como palabra aislada (no como subcadena).

SINÓPSIS
	$0 [-verbose] palabra_reservada

	palabra_reservada:
		elif | else | esac | fi | for | function |
		if | in | select | then | until | while | time

OPCIONES
	-verbose
		Además de la salida por defecto, con el uso de la opción -verbose
		mostrará por pantalla otro campo en el listado, siendo éste la línea
		en la que aparece la coincidencia de la palabra reservada introducida.

EJEMPLO
	$0 -verbose elif
	$0 esac

EOF
exit;
}

function VERBOSE() {
	find /etc -type f -exec file {} + 2>/dev/null | grep -i 'shell script' | cut -d: -f1 | xargs grep -nrws $1;
}

function RESERVADA() {
	find /etc -type f -exec file {} + 2>/dev/null | grep -i 'shell scrip' | cut -d: -f1 | xargs grep -nrws $1 | cut -d: -f1,2;
}

if [[ $# -eq 0 ]]; then
	echo "No hay suficientes parámetros.";
	ERROR;
fi

if [[ $1 == -verbose ]]; then
	if [[ $# -gt 2 ]]; then
		echo "Demasiados parámetros.";
		ERROR;
	elif [[ $# -eq 1 ]]; then
		echo "Falta la palabra reservada.";
		ERROR;
	else
		case $2 in
		  elif | else | esac | fi | for | function | if | in | select | then | until | while | time)
			echo "Palabra reservada correcta.";
			echo "Esto puede tardar unos segundos.";
			echo "";
			echo "===================================================";
			echo "";
			VERBOSE $2;
		  ;;
		  *)
			echo "$2 No es una palabra reservada.";
			ERROR;
		esac
	fi
else
	if [[ $# -gt 1 ]]; then
		echo "Demasiados parámetros.";
		ERROR;
	else
		case $1 in
		  elif | else | esac | fi | for | function | if | in | select | then | until | while | time)
			echo "Palabra reservada correcta.";
			echo "Esto puede llevar unos segundos.";
			echo "";
			echo "=================================================";
			echo "";
			RESERVADA $1;
		  ;;
		  *)
			echo "$1 No es una de las palabras reservadas.";
			ERROR;
		esac
	fi
fi
