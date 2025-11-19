#! /bin/bash

# Comandos útiles: grep. Otros comandos útiles: file, find

# Escribe el script consulta.sh:
# Argumento opcional: un nombre de directorio. Verifica que el argumento es un directorio
# Si no recibe un nombre de directorio, trata con el directorio actual
# Busca todos los archivos ordinarios que se encuentren bajo ese directorio (a todos los niveles de profundidad)
# Para cada archivo de contenido texto accesible en lectura, preguntar al usuario si desea consultar el archivo. Los archivos que no sean texto se ignorarán
# El usuario podrá introducir 's', 'S', 'si', 'SI' para consultar el archivo,
# y 'n', 'N', 'no', 'NO' para no consultarlo, o 'q' para salir del script.
# Cualquier otra respuesta generará una nueva pregunta al usuario:
	# Si el usuario desea consultar el archivo, muestra el contenido paginado de este en la pantalla.
	# Si el usuario no desea consultar el archivo, pase al archivo siguiente.

function ERROR() {
cat << EOF
USAGE
	$0 [ruta/directorio]

DESCRIPCIÓN
	El comando $0 buscará en la ruta dada los ficheros que se hayan dentro de éste,
	a todos los niveles. Si no se proporciona ruta o la ruta no es un directorio,
	se mostrará el resultado de los ficheros bajo el directorio actual de trabajo.

	Las opciones posibles son s|S|si|SI para visualizar el fichero.
	Las opciones posibles son n|N|no|NO para continuar sin visualizar dicho fichero.
	La opción para salir es q.
	Cualquier otra respuesta, volverá a preguntar al usuario qué quiere hacer con dicho fichero.
EOF
exit 1;
}

if [[ $# -gt 1 ]]; then
	echo "Has introducido demasiados argumentos.";
	ERROR;
elif [[ $# -eq 0 ]]; then
	ficheros=( $(find . -type f -exec grep -Il . {} + 2>/dev/null) );

	for fichero in ${ficheros[@]}; do
		while true; do

			if [[ -r $fichero ]]; then
				read -p "¿Quieres leer el fichero $fichero? s/n/q --> " opc;
				case $opc in
					s|S|si|SI)
						less $fichero;
						break;
					;;
					n|N|no|NO)
						break;
					;;
					q)
						exit 0;
					;;
					*)
						echo "Opcion no válida";
					;;
				esac
			else
				break;
			fi
		done
	done
elif [[ -d $1 && -x $1 ]]; then
	ficheros=( $(find $1 -type f -exec grep -Il . {} + 2>/dev/null) );

        for fichero in ${ficheros[@]}; do
                while true; do

			if [[ -r $fichero ]]; then
	                        read -p "¿Quieres leer el fichero $fichero? s/n/q --> " opc;
        	                case $opc in
                	                s|S|si|SI)
                        	                less $fichero;
                                	        break;
          	                      ;;
                	                n|N|no|NO)
                        	                break;
                    	            ;;
                        	        q)
                                	        exit 0;
                      	          ;;
                        	        *)
                                	        echo "Opcion no válida";
                  	              ;;
                  	      esac
			else
				break;
			fi
                done
        done

fi

