# GRAMATICA DE LA SHELL

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
**&#91;&#91; -e archivo &#93;&#93;** Comprueba si existe\
**&#91;&#91; -f archivo &#93;&#93;** Comprueba si es un fichero\
**&#91;&#91; -d archivo &#93;&#93;** Comprueba si es un directorio\
**&#91;&#91; -r archivo &#93;&#93;** Comprueba si existe y permite lectura\
**&#91;&#91; -w archivo &#93;&#93;** Comprueba si existe y permite lectura\
**&#91;&#91; -x archivo &#93;&#93;** Comprueba si existe y permite ejecucion\
**&#91;&#91; -s archivo &#93;&#93;** Comprueba si existe y el tamaño es mayor a cero\
**&#91;&#91; -z archivo &#93;&#93;** Comprueba si existe y el tamaño es cero\

**Comparador de cadenas**\
**>** Mayor que\
**<** Menor que\
**=** Asignacion\
**!=** Diferente a\
**==** Igual a (patrón)\
**=~** Igual a (expresión regular)\

**Comparadores numéricos**\
**-gt** Greater than\
**-lt** Lower than\
**-ge** Greater or equal\
**-le** Lower or equal\
**-eq** Equal to\
**-ne** Not equal\

> [!NOTE]
> [[ 001 = 1 ]] es o [[ 011 == 1 ]] falso (ya que compara cadenas de caracteres)\
> mientras que [[ 001 -eq 1 ]] es cierto

**Operadores booleanos**\
**&&** And\
**||** Or\

### while y until

**ejemplo de while**
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
> until se repetirá hasta que la condición se cumpla\

### function

**ejemplo de función**
```
function saludar() {
	echo "Hola mundo!";
}

saludar
```
