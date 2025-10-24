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
***&#91;&#91; -z archivo &#93;&#93;*** Comprueba si existe y el tamaño es cero

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
***&&*** And\
***||*** Or

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
