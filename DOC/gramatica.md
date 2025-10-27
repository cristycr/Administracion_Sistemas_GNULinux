# GRAMÁTICA DE LA SHELL

## ORDENES COMPUESTAS

### if

**ejemplo de if, elif y else:**
```
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
Éstas se pueden usar por sí mismas, sin necesidad de utilizar if\
***&#91;&#91; -e archivo &#93;&#93;*** Comprueba si existe\
***&#91;&#91; -f archivo &#93;&#93;*** Comprueba si es un fichero\
***&#91;&#91; -d archivo &#93;&#93;*** Comprueba si es un directorio\
***&#91;&#91; -r archivo &#93;&#93;*** Comprueba si existe y permite lectura\
***&#91;&#91; -w archivo &#93;&#93;*** Comprueba si existe y permite lectura\
***&#91;&#91; -x archivo &#93;&#93;*** Comprueba si existe y permite ejecucion\
***&#91;&#91; -s archivo &#93;&#93;*** Comprueba si existe y el tamaño es mayor a cero\
***&#91;&#91; -z archivo &#93;&#93;*** Comprueba si existe y el tamaño es cero\
***&#91;&#91; -b archivo &#93;&#93;*** Comprueba si es archivo especial de dispositivo de tipo bloque\
***&#91;&#91; -c archivo &#93;&#93;*** Comprueba si es archivo especial de dispositivo de tipo caracter\
***&#91;&#91; -p archivo &#93;&#93;*** Comprueba si es archivo especial de dispositivo de tipo pipe\
***&#91;&#91; -s archivo &#93;&#93;*** Comprueba si es archivo especial de dispositivo de tipo socket

**Comparador de cadenas**\
***>*** Mayor que\
***<*** Menor que\
***=*** Asignacion\
***!=*** Diferente a\
***==*** Igual a (patrón)\
***=~*** Igual a (expresión regular)

**Comparadores numéricos**\
***-gt*** Greater than\
***-lt*** Lower than\
***-ge*** Greater or equal\
***-le*** Lower or equal\
***-eq*** Equal to\
***-ne*** Not equal

> [!NOTE]
> [[ 001 = 1 ]] es o [[ 011 == 1 ]] falso (ya que compara cadenas de caracteres)\
> mientras que [[ 001 -eq 1 ]] es cierto

**Operadores booleanos**\
**&&** And\
**||** Or

### while y until

**ejemplo de while:**
```
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
```
function saludar() {
	echo "Hola mundo!";
}

saludar
```

# PARÁMETROS
En lo que se refiere a la shell, una **variable** es un parámetro identificado por un nombre

Se le asignan valores mediante esta sentencia sencilla
```
nombre=[valor]
```
Si no definimos un valor, ésta se asigna vacía

## Parámetros posicionales

Éstos están representados con números enteros, distintos de 0.\
Se asignan a partir de los argumentos de la shell cuando ésta es llamada\
**ejemplo:**
```
ls -l -a

# Los parámetros posicionales son los siguientes
$1 = -l
$2 = -a
```

Si el parámetro posicional cuenta con más de un dígito, debe estar aislado con llaves.
```
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
```
function ERROR() {
	exit 1;
}

# En este caso, $? será 1.
```
> [!NOTE]
> Tanto ```$@``` como ```$*```, cuando se expanden sin comillas dobles,
> devuelven por la salida estándar el mismo resultado.


## Variables de la shell
La shell tiene una serie de variables definidas automáticamente:

**PPID**\
El PID del proceso padre de la shell. Esta variable es de lectura exclusiva.\

**PWD**\
Es el directorio de trabajo actual como lo pone la orden ```cd```\

**OLDPWD**\
Es el directorio de trabajo anterior como lo puso la orden ```cd```\

**REPLY**\
La línea de entrada leída por la orden interna ```read``` cuando no se le dan argumentos.\

**UID**\
Se expande al UID del usuario en curso, puesta en el arranque de la shell. Esta variable es de lectura excliva.\

**EUID**\
Se expande al UID efectivo del usuario en curso, puesta en el arranque de la shell. Esta variable es de lectura exclusiva.\

**GROUPS**\
Una variable vector conteniendo la lista de grupos de los que el usuario actual es miembro. Esta variable es de lectura exclusiva.\

**BASH**\
Se expande al nombre completo del fichero empleado para llamar a esta instancia de **bash**.\

**BASH_VERSION**\
Se expande a una cadena que describe la versión de esta instancia de **bash**.\

**BASH_VERSINFO**\
Una variable vector de lectura exclusiva cuyos elementos contienen información de versión para esta instancia de **bash**. Los valores asignados a los miembtros del vector son como sigue:\
	- **BASH_VERSINFO[0]**\
	El número mayor de versión (la _distribución_)\
	
	- **BASH_VERSINFO[1]**\
	El número menor de versión (la _versión_)\

	- **BASH_VERSINFO[2]**\
	El nivel de parcheo.\

	- **BASH_VERSINFO[3]**\
	La versión de construcción.\	

	- **BASH_VERSINFO[4]**\
	El estado de la distribución (por ejemplo, _beta1_).\

	- **BASH_VERSINFO[5]**\
	El valor de **MACHTYPE**.\

