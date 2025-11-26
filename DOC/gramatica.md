# GRAMÁTICA DE LA BASH

## Órdenes simples

## Tuberías

## Listas

## Órdenes compuestas

### IF

**Ejemplo de if, elif y else:**
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
| `[[ -w archivo ]]` | Comprueba si existe y permite escritura |
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
> Tanto [[ 001 = 1 ]] como [[ 011 == 1 ]] devuelven FALSE (ya que comparan cadenas de caracteres)\
> Mientras que [[ 001 -eq 1 ]] devolverá TRUE (ya que estamos usando los comparadores numéricos)

**Operadores booleanos**
| Operador | Descripción |
| --- | --- |
| `&&` | AND. Sólo si las dos condiciones se cumplen, devuelve TRUE |
| `\|\|` | OR. Si una o ambas condiciones se cumplen, devuelve TRUE |

### FOR
**Ejemplo de bucle for**
```bash
for (( i=0; i -lt 10; i++ )); do
	echo "Hola";	
done
```
### SELECT

### CASE

### WHILE y UNTIL

**Ejemplo de while y ejemplo de until**
```bash
contador=0

#while
while (( $contador < 11 )); do
	((contador++));
	echo "Hola mundo";
done;

#until
until (( $contador == 10 )); do
	((contador++));
	echo "Hola mundo";
done;
```

> [!NOTE]
> Aunque la salida será la misma, la diferencia reside en:\
> - While se repetirá **mientras** que la condición se cumpla\
> - Until se repetirá **hasta** que la condición se cumpla

### FUNCTION

**Ejemplo de función**
```bash
function saludar() {
	echo "Hola mundo!";
}

saludar
```
[Aquí tienes una serie de ejercicios para practicar funciones resultos](../SCRIPTS/bash_p08)
# COMENTARIOS

# ENTRECOMILLADO

# PARÁMETROS
En lo que se refiere a la shell, una **variable** es un parámetro identificado por un nombre.

Se le asignan valores mediante esta sentencia sencilla:
```bash
nombre=[valor]
```
Si no definimos un valor, ésta se asigna vacía.

## Parámetros posicionales

Éstos están representados con números enteros, distintos de 0.\
Se asignan a partir de los argumentos de la shell cuando ésta es llamada.\
**Ejemplo:**
```bash
ls -l -a

# Los parámetros posicionales son los siguientes
# $1 -> -l
# $2 -> -a
```

Si el parámetro posicional cuenta con más de un dígito, debe estar aislado con llaves.
```bash
${11}
```

Ésto es necesario porque la shell puede interpretar que estamos concatenando caracteres, de forma que si escribimos $11, nos devolvería el valor de $1 pegado al dígito 1.\
Imaginando que `$1 = hola`, si hiciéramos un echo de esta forma: `echo $11`, tendríamos como resultado `hola1`.\

De igual manera, ésto se aplica a cualquier variable. Si queremos concatenar una variable llamada `$var` con la palabra "texto", no vale con escribir simplemente `echo $vartexto`, ya que la bash buscará una variable con ese nombre exacto, sino que tenemos que hacer esto: `echo ${var}texto`.
## Parámetros especiales

Sólo pueden referenciarse; no se permite asignarles valores.

`$*`\
Se expande a los parámetros posicionales, empezando por el primero. Cuando la expansión ocurre entre comillas dobles, representa una única cadena de texto, donde los parámetros se separan por la variable IFS. Si la variable IFS no está definida, por defecto almacena un espacio " ". IFS también puede estar vacía, y los parámetros se representarán juntos sin separador.\
_"$1c$2c..."_

`$@`\
Se expande a los parámetros posicionales, empezando por el primero. Cuando se efectúa entre comillas dobles, los parámetros posicionales se expande de esta manera:\
_"$1" "$2"..._

`$#`\
Se expande al número de parámetros posicionales.

`$?`\
Se expande a un número que representa el estado de la ejecución más reciente, que suele ser un _exit_. Si devuelve 0, la ejecución ha salido bien. Si ha salido mal, se representa con un número del 1 al 100.
```bash
function ERROR() {
	exit 1;
}

# En este caso, $? será 1.
```

`$-`\
Se expande a las opciones de la shell activas actualmente según se hayan especificado en la llamada, mediante la orden interna `set`, o las que haya puesto la misma shell (como la opción **-i**). Lo que quiere decir: igual que otros comandos, cuando hacemos una llamada a `bash`, podremos invocar una nueva bash dentro de la actual, donde pobremos añadir todas las opciones que queramos según lo que necesitemos (como podemos ver en `man bash`). Por lo tanto, la variable `$-` mostrará las opciones que está utilizando la bash actual.\
Podemos además modificar las opciones de la bash actual con el comando `set`. Si no modificamos nada y ejecutamos una shell de forma normal, ésta se ejecutará con una serie de opciones por defecto.

`$$`\
Se expande al PID de la shell. En una subshell (), se expande al PID de la shell actual, no al de la subshell. Podemos ver el mismo resultado imprimiento la variable BASHPID `echo $BASHPID`.

`$!`\
Se expande al PID de la orden más recientemente ejecutada en segundo plano (asíncronamente). Para ejecutar un comando en segundo plano, podemos hacer uso del carácter especial **&** de la siguiente manera.\
```bash
sleep 5&
```
Si hacemos uso del `$!`, éste mostrara el PID de esta última orden.

`$0`\
Se expande al nombre de la shell o del bash script. Si la **bash** se llama con un fichero script, `$0` tomará como valor el nombre de ese fichero. Si **bash** se arranca con la opción `-c`, entonces `$0` tome el nombre del primer parámetro posicional si hay alguno presente. Si no, almacenará el nombre del script usado para llamar a la **bash**.

`$_`\
Se expande al último argumento del comando anterior o, en ciertos contextos, el nombre del último comando ejecutado. Se actualiza automáticamente después de cada comando de la shell.

> [!NOTE]
> Tanto `$@` como `$*`, cuando se expanden sin comillas dobles, devuelven por la salida estándar el mismo resultado.

## Variables de la shell
La shell tiene una serie de variables que se definen automáticamente. Éstas se conocen como variables de entorno. Existe un comando interno de bash para visualizar todas las variables de entorno en el momento que se ejecuta. Este comando es `set`.\
[Para ver la lista completa de variables de entorno de la Bash, visita este documento.](env.md)


## Vectores (arrays)
En bash, las variables son de tipo _vector monodimensional_. Cualquier variable puede usarse como un vector. Igual que en otros lenguajes de programación, los elementos se indexan utilizando números enteros, empezando por el cero.

Se asignan valores a los vectores mediante asignaciones compuestas de la forma `vector=(valor1 ... valorn)` donde cada valor es representado con un índice, como dijimos antes.\

Para crear el vector, sólo necesitamos el valor; no es necesario índicar a qué índice corresponde para ello, pero se puede hacer. En la asignación de valores, indicaríamos el índice entre corchetes además del valor. Entonces ese valor se asignará a ese índice concreto.

Cualquier elemento de un vector puede referenciarse mediante `${vector[índice]}`, por ejemplo `$@[1]` que, como vimos antes, correspondería a la variable `$1`.\
Las llaves son necesarias para evitar conflictos con la expansión de nombre de caminos.

Si _índice_ es @ o *, se expande a todos los elementos del vector.

**Ejemplo de vectores**
```bash
vector=(hola me llamo Tux);

echo ${vector[0]}; # Esto devuelve 'hola'

echo ${vector[@]}; # Esto devuelve 'hola me llamo Tux', igual que si usáramos ${vector[*]}

# EXTRA -->
echo ${#vector[@]} # Si añadimos '#' delante. Nos devolverá la longitud del vector, o sea, el número de elementos que lo componen.
```

# EXPANSIÓN

## Expansión de llaves

## Expansión de tilde

## Expansión de parámetro

## Sustitución de orden



## Expansión aritmética
La expansión aritmética permite interpretar una expresión aritmética y la sustitución de ésta por el resultado. El formato para la expansión aritmética es:
```bash
$((expresión))
```
Le _expresión_ se trata como si estuviera entre comillas dobles. Sin embargo, si dentro de los paréntesis aparece otra comilla doble, **Bash** no la interpreta de manera especial.

Todos los elementos dentro de la expresión (como variables o comandos) se procesan primero mediante:
- Expansión de parámetros
- Expansión de cadenas
- Sustitución de comandos
- Eliminación de comillas

Además, las expresiones aritméticas puede anidarse unas dentro de otras.\
Luego, **Bash** evalúa la expresión siguiendo las reglas de **evaluación aritmética**. Si la expresión no es válida, **Bash** mostrará un mensaje de error y no reemplazará nada.

## Sustitución de proceso
