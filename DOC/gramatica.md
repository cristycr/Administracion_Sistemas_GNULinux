# GRAMÁTICA DE LA BASH

## Órdenes compuestas

### if

**ejemplo de if, elif y else:**
```bash
if [[ -f $FILE ]]; then
	echo "FICHERO";
elif [[ -d $FILE ]]; then
	echo "DIRECTORIO";
else
	echo "ADIOS";
fi
```

### Expresiones condicionales (todos para doble corchetes [[ ]])
**Evaluacion de archivos**\
Éstas se pueden usar por sí mismas, sin necesidad de utilizar if
| Sintaxis | Descripción |
| --- | --- |
| `[[ -e archivo ]]` | Comprueba si existe |
| `[[ -f archivo ]]` | Comprueba si es un fichero |
| `[[ -d archivo ]]` | Comprueba si es un directorio |
| `[[ -r archivo ]]` | Comprueba si existe y permite lectura |
| `[[ -w archivo ]]` | Comprueba si existe y permite lectura |
| `[[ -x archivo ]]` | Comprueba si existe y permite ejecucion |
| `[[ -s archivo ]]` | Comprueba si existe y el tamaño es mayor a cero |
| `[[ -z archivo ]]` | Comprueba si existe y el tamaño es cero |
| `[[ -b archivo ]]` | Comprueba si es archivo especial de dispositivo de tipo bloque |
| `[[ -c archivo ]]` | Comprueba si es archivo especial de dispositivo de tipo caracter |
| `[[ -p archivo ]]` | Comprueba si es archivo especial de dispositivo de tipo pipe |
| `[[ -s archivo ]]` | Comprueba si es archivo especial de dispositivo de tipo socket |

**Comparador de cadenas**
| Comparador | Descripción |
| --- | --- |
| `>` | Mayor que |
| `<` | Menor que |
| `=` | Asignacion |
| `!=` | Diferente a |
| `==` | Igual a (patrón) |
| `=~` | Igual a (expresión regular) |

**Comparadores numéricos**
| Comparador | Descripción |
| --- | --- |
| `-gt` | Greater than |
| `-lt` | Lower than |
| `-ge` | Greater or equal |
| `-le` | Lower or equal |
| `-eq` | Equal to |
| `-ne` | Not equal |

> [!NOTE]
> [[ 001 = 1 ]] es o [[ 011 == 1 ]] falso (ya que compara cadenas de caracteres)\
> mientras que [[ 001 -eq 1 ]] es cierto

**Operadores booleanos**
| Operador | Descripción |
| --- | --- |
| `&&` | And. Sólo si las dos condiciones se cumplen, devuelve True |
| `\|\|` | Or. Si una o ambas condiciones se cumplen, devuelve True |

### while y until

**ejemplo de while:**
```bash
contador=0

while (( $contador < 11 )); do
	((contador++));
	echo "Hola mundo";
done;

until (( $contador == 10 )); do
	((contador++));
	echo "Hola mundo";
done;
```

> [!NOTE]
> Aunque la salida será la misma, la diferencia reside en que\
> while se repetirá mientras la condición se siga cumpliendo y\
> until se repetirá hasta que la condición se cumpla

### function

**ejemplo de función:**
```bash
function saludar() {
	echo "Hola mundo!";
}

saludar
```

# PARÁMETROS
En lo que se refiere a la shell, una **variable** es un parámetro identificado por un nombre

Se le asignan valores mediante esta sentencia sencilla
```bash
nombre=[valor]
```
Si no definimos un valor, ésta se asigna vacía

## Parámetros posicionales

Éstos están representados con números enteros, distintos de 0.\
Se asignan a partir de los argumentos de la shell cuando ésta es llamada\
**ejemplo:**
```bash
ls -l -a

# Los parámetros posicionales son los siguientes
$1 = -l
$2 = -a
```

Si el parámetro posicional cuenta con más de un dígito, debe estar aislado con llaves.
```bash
${11}
```

## Parámetros especiales

Sólo pueden referenciarse; no se permite asignarles nada.\
***&#42;***\
Se expande a los parámetros posicionales, empezando por el primero. Cuando la expansión ocurre entre comillas dobles, representa una única cadena de texto, donde los parámetros se separan por la variable IFS. Si la variable IFS no está definida, por defecto almacena un espacio " ". IFS también puede estar vacía, y los parámetros se representarán juntos sin separador.\
_"$1c$2c..."_

***@***\
Se expande a los parámetros posicionales, empezando por el primero. Cuando se efectúa entre comillas dobles, los parámetros posicionales se expande de esta manera:\
_"$1" "$2"..._

***#***\
Se expande al número de parámetros posicionales.

***?***\
Se expande a un número que representa el estado de la ejecución más reciente, que suele ser un _exit_. Si devuelve 0, la ejecución ha salido bien. Si ha salido mal, se representa con un número del 1 al 100.
```bash
function ERROR() {
	exit 1;
}

# En este caso, $? será 1.
```

***-***\
Se expande a las opciones de la shell activas actualmente según se hayan especificado en la llamada, mediante la orden interna `set`, o las que haya puesto la misma shell (como la opción **-i**). Lo que quiere decir: igual que otros comandos, cuando hacemos una llamada a `bash`, podremos invocar una nueva bash dentro de la actual, donde pobremos añadir todas las opciones que queramos según lo que necesitemos (como podemos ver en `man bash`). Por lo tanto, la variable `$-` mostrará las opciones que está utilizando la bash actual.\
Podemos además modificar las opciones de la bash actual con el comando `set`. Si no modificamos nada y ejecutamos una shell de forma normal, ésta se ejecutará con una serie de opciones por defecto.

***$***\
Se expande al PID de la shell. En una subshell (), se expande al PID de la shell actual, no al de la subshell. Podemos ver el mismo resultado imprimiento la variable BASHPID `echo $BASHPID`.

***!***\
Se expande al PID de la orden más recientemente ejecutada en segundo plano (asíncronamente). Para ejecutar un comando en segundo plano, podemos hacer uso del carácter especial **&** de la siguiente manera.\
```bash
sleep 5&
```
Si hacemos uso del `$!`, éste mostrara el PID de esta última orden.

> [!NOTE]
> Tanto `$@` como `$*`, cuando se expanden sin comillas dobles,
> devuelven por la salida estándar el mismo resultado.


## Variables de la shell
La shell tiene una serie de variables que se definen automáticamente. Éstas variables se conocen como variables de entorno. Existe un comando interno de bash para visualizar todas las variables de entorno en el momento que se ejecuta. Este comando es `set`.\
[Para ver la lista completa de variables de entorno de la Bash, ve aquí](env.md)


## Vectores
En bash, las variables son de tipo _vector monodimensional_. Cualquier variable puede usarse como un vector. Igual que en otros lenguajes de programación, los elementos se indexan utilizando números enteros, empezando por el cero.

Se asignan valores a los vectores mediante asignaciones compuestas de la forma _nombre=(valor1 ... valorn)_, donde cada valor es de la forma _[índice]=cadena_. Sólo _cadena_ es necesario. Si se suministrara en la asignación el índice entre corchetes además de _cadena_, se asignará a ese índice concreto.

Cualquier elemento de un vector puede referenciarse mediante ${nombre[índice]}. Las llaves son necesarias para evitar conflictos con la expansión de nombre de caminos.\
Si _indice_ es @ o *, la palabra se expande a todos los miembros de _nombre_.
