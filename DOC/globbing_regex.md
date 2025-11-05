# PATRONES DE COINCIDENCIA Y EXPRESIONES REGULARES

## Introducción
En la Bash, los patrones de coincidencia y las expresiones regulares son utilizadas\
para buscar, filtrar y manipular texto de manera flexible y eficiente.

Los patrones de coincidencia (como los que usan los comodines ```*```, ```?``` o ```[...]```)\
se aplican principalmente en la shell para tareas como seleccionar archivos o comparar cadenas\
simples dentro de scripts.

Por otro lado, las **expresiones regulares** (regex) ofrecen una forma más potente y precisa,\
auque más compleja, de definir patrones, y se usan comúnmente con comandos como ```grep```, ```sed``` o ```awk```\
para analizar, buscar y reemplazar texto según reglas avanzadas.

En conjunto, ambas herramientas permiten automatizar tareas de procesamiento de texto y\
administración del sistema de manera rápida y precisa.

## Patrones de coincidencia (globbing)
En Bash, los patrones (también llamados _globs_) se usan para comparar nombres de ficheros, cadenas y otros textos. No son expresiones regulares completas, pero tienen una sintaxis similar en algunos aspectos.

### Reglas básicas
- Cualquier carácter **no especial** en un patrón coincide **consigo mismo**. Por ejemplo:
  - El patrón `hola` sólo coincide con la cadena `hola`.
- El carácter **NUL** (`\0`) **no puede aparecer** en un patrón.
- Los caracteres **especiales** deben protegerse (con comillas o la barra de escape **\**) si se desea que se interpreten literalmente. Por ejemplo:
  - Para que `*` se interprete literalmente, se debe escribir `\*` o `"*"`.

### Caracteres especiales

| Carácter | Significado | Ejemplo | Coincide con |
| --- | --- | --- | --- |
| `*` | Secuencia de uno, muchos o ningún caracter | `a*` | `a`,`abc`,`archivo`,`a123` |
| `?` | Corresponde a un solo carácter en la posición que ocupa | `a?b` | `acb`, `a1b`, `a_b` |
| `[...]` | Cualquier carácter dentro del conjunto indicado | `c[aeiou]sa` | `casa`, `cesa`, `cisa` |

### Conjuntos de caracteres `[...]`
Dentro de los corchetes puedes definir:
| Formato | Significado | Ejemplo | Coincide con |
| --- | --- | --- | --- |
| Listas de caracteres | Coincide con uno de los caracteres dentro de los corchetes | `[abc]` | `a`, `b` o `c` |
| Rangos | Puede ser de números, letras mayúsculas o letras minúsculas | `[A-Z]` | Cualquier letra mayúscula |
| Negación | Busca coincidencia con cualquier carácter excepto los que hay dentro de corchetes | `[!0-9]` | Cualquier cosa menos un dígito |

- Para representar guiones y corchetes:
  - Para que un `-` no se interprete como rango, colócalo **al principio o al final**: `[-a-z]` o `[a-z-]`.
  - Para incluir `]` literalmente, colócalo **como primer carácter**: `[]a-z]`.

### Clases de caracteres POSIX
Dentro de `[...]` se puede usar clases de caracteres usando la sintaxis `[:clase:]`.\
Ejemplo: `[[:digit:]]` coincide con cualquier número del 0 al 9.

| Clase POSIX | Coincide con |
| --- | --- |
| `[:alnum:]` | Letras y números |
| `[:alpha:]` | Letras |
| `[:ascii:]` | Caracteres ASCII |
| `[:blank:]` | Espacios y tabulaciones |
| `[:cntrl:]` | Caracteres de control |
| `[:digit:]` | Dígitos (0-9) |
| `[:graph:]` | Cualquier carácter visible |
| `[:lower:]` | Letras minúsculas |
| `[:upper:]` | Letras mayúsculas |
| `[:print:]` | Cualquier carácter imprimible |
| `[:punct:]` | Signos de puntuación |
| `[:space:]` | Espacios en blanco (espacio, tab, salto de línea, etc) |
| `[:xdigit:]` | Dígitos hexadecimales (0-9,a-f,A-F) |

### Patrones extendido (extglob)
Bash puede activar patrones más avanzados con `shopt -s extglob`.\
Los patrones extendidos tienen el formato `caracter-especial(patrones)`, donde **patrones** puede representar un patrón o varios separados por un pipe `|`, llamado **lista-patrón**. Los siguientes operadores permiten crear coincidencia más flexibles.

| Patrón | Significado | Ejemplo | Coincide con |
| --- | --- | --- | --- |
| `?(patrones)` | Cero o una ocurrencia | `?(foo)` | `""`,`foo` |
| `*(patrones)` | Cero o más ocurrencias | `*(ab)` | `""`, `a`, `b`, `ab`, `aab`, `bbab` |
| `+(patrones)` | Una o más ocurrencias | `+(ab)` | `a`, `b`, `ab`, `aba` |
| `@(patrones)` | Exactamente una coincidencia | `@(jpg)` | `png` |
| `!(patrones)` | Coincide con todo excepto los patrones listados | `!(foo)` | `bar` |

Ejemplo 1 con `@(patrones)`
```bash
for f in @(hola|adios).txt; do
	echo "$f"
done
# Busca coincidencia con un fichero llamado hola.txt o adios.txt
```

Ejemplo 2 con `!(patrones)`
```bash
for f in !(*.txt|*.md); do
	echo "Este fichero no es de texto: $f"
done
# Buscará coincidencia con cualquier fichero no terminado en .txt ni .md
```

## EXPRESIONES REGULARES (REGEX)
