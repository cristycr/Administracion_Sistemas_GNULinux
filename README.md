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

### Expresiones condicionales (todos para doble corchetes [[ ]] )
#### Evaluacion de archivos
**&#91;&#91; -e archivo &#93;&#93;** Comprueba si existe\
**&#91;&#91; -f archivo &#93;&#93;** Comprueba si es un fichero\
**&#91;&#91; -d archivo &#93;&#93;** Comprueba si es un directorio\
**&#91;&#91; -r archivo &#93;&#93;** Comprueba si existe y permite lectura\
**&#91;&#91; -w archivo &#93;&#93;** Comprueba si existe y permite lectura\
**&#91;&#91; -x archivo &#93;&#93;** Comprueba si existe y permite ejecucion\
**&#91;&#91; -s archivo &#93;&#93;** Comprueba si existe y el tamaño es mayor a cero\
**&#91;&#91; -z archivo &#93;&#93;** Comprueba si existe y el tamaño es cero\

#### Comparador de cadenas
**>** Mayor que\
**<** Menor que\
**=** Asignacion\
**!=** Diferente a\
**==** Igual a (patrón)\
**=~** Igual a (expresión regular)\

#### Comparadores numéricos
**-gt** Greater than\
**-lt** Lower than\
**-ge** Greater or equal\
**-le** Lower or equal\
**-eq** Equal to\
**-ne** Not equal\

> [!NOTE]
> [[ 001 = 1 ]] es falso, mientras que [[ 001 -eq 1 ]] es cierto

#### Operadores booleanos
**&&** And\
**||** Or\
