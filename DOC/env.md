# Variables de entorno de la Bash
## Introducción
Las variables de entorno son valores definidos en el sistema que afectan al comportamiento de los procesos y programas que se ejecutan en el sistema.\
Se utilizan para configurar aspectos como el idioma, la ruta de búsqueda de comandos, el directorio personal del usuario y muchas otras opciones que influyen en el entorno de ejecución.

En este documento encontrarás una lista detallada de todas las variables de entorno hasta la fecha, junto con su descripción y utilidad.

Esta lista puede servir como referencia rápida para tareas de administración, scripting o resolución de problemas.

**PPID**\
El PID del proceso padre de la shell. Esta variable es de lectura exclusiva.

**PWD**\
Es el directorio de trabajo actual como lo pone la orden `cd`

**OLDPWD**\
Es el directorio de trabajo anterior como lo puso la orden `cd`

**REPLY**\
La línea de entrada leída por la orden interna `read` cuando no se le dan argumentos.

**UID**\
Se expande al UID del usuario en curso, puesta en el arranque de la shell. Esta variable es de lectura excliva.

**EUID**\
Se expande al UID efectivo del usuario en curso, puesta en el arranque de la shell. Esta variable es de lectura exclusiva.

**GROUPS**\
Una variable vector conteniendo la lista de grupos de los que el usuario actual es miembro. Esta variable es de lectura exclusiva.

**BASH**\
Se expande al nombre completo del fichero empleado para llamar a esta instancia de **bash**.

**BASH_VERSION**\
Se expande a una cadena que describe la versión de esta instancia de **bash**.

**BASH_VERSINFO**\
Una variable vector de lectura exclusiva cuyos elementos contienen información de versión para esta instancia de **bash**. Los valores asignados a los miembtros del vector son como sigue:

- **BASH_VERSINFO[0]**\
El número mayor de versión (la _distribución_)

- **BASH_VERSINFO[1]**\
El número menor de versión (la _versión_)

- **BASH_VERSINFO[2]**\
El nivel de parcheo.

- **BASH_VERSINFO[3]**\
La versión de construcción.

- **BASH_VERSINFO[4]**\
El estado de la distribución (por ejemplo, _beta1_).

- **BASH_VERSINFO[5]**\
El valor de **MACHTYPE**.

**SHLVL**\
Se incrementa en uno cada vez que se arranca una nueva instancia de **bash**.

**RANDOM**\
Cada vez que este parámetro sea referenciado, se genera un entero aleatorio entre 0 y 32767. La secuencia de números aleatorios

**SECONDS**\
Devuelve el número de segundos transcurridos desde que abrimos la shell. Si se asigna un valor a **SECONDS**, el valor devuelto posteriormente será el número de segundos transcurridos desde la asignación más el valor asignado.

**LINENO**\
Cuando se llama a esta variable, la shell sustituye un número en base 10 representando el número de línea secuencial actual (empezando por 1) dentro de un script o función. Si no estamos en un script o función, no se garantiza que el valor sustituido tenga significado.

**HISTCMD**\
Es el índice en la lista del historial de la orden actual.

**DIRSTACK**\
Ésta es una variable vector que aloja los contenidos actuales de la pila de directorios. Los directorios aparecen en la pila en el orden en el que se muestran con la orden interna **dirs** . La asignación a miembros de este vector puede emplearse para modificar directorios que ya estén en la pila, pero entonces deben utilizarse las órdenes internas **pushd** y **popd** para añadir y quitar directorios. La asignación de esta variable no cambiará el directorio de trabajo.\
[Para leer sobre vectores, ve a este documento](gramatica.md#vectores)

**PIPESTATUS**\
Otra variable vector. Ésta contiene una lista de valores de estado de salida de los procesos en la tubería en primer plano ejecutada más recientemente (que puede contener una sola orden).

**OPTARG**\
El valor del último argumento que es una opción procesado por la orden interna `getopts`\
[Para leer sobre órdenes internas de la bash, ve a este documento](comandos.md#ordenes-internas)

**OPTIND**\
El índice del siguiente argumento a ser procesado por la orden interna `getopts`

**HOSTNAME**\
Imprime el nombre del anfitrión actual, o sea, el nombre del ordenador.

**HOSTTYPE**\
Imprime una cadena que indica el tipo o arquitectura del sistema en el que se está ejecutando la sesión de la shell. Devolverá valores como *x86_64, i686, aarch64, armv71,...*

**OSTYPE**\
Imprime una cadena que indica descripbe el sistema operativo en el que bash se está ejecutando. El valor predefinido depende del sistema. En Linux es "linux".

**MACHTYPE**\
Imprime el tipo de máquina y sistema operativo en un formato estándar llamado *"tripleta de configuración"*, que siguen el esquema: *arquitectura-fabricante-sistema*

**SHELLOPTS**\
Contiene una lista de opciones actualmente habilitadas en la Bash. Cada palabra en la lista es un argumento válido para la opción *-o* de la orden interna `set`. Las opciones que aparecene son las que aparecen como *on* en `set -o`. Esta varialbe es de lectura exclusiva.

En algunos casos, la *bash* asigna un valor predeterminado a una variable y hace uso de ellas. Éstas son las siguientes:

**IFS**
Es el *Separador Interno de Campos* (Internal Field Separator). Es de las *más importantes y delicadas* en Bash. Controla cómo la shell separa los campos de texto cuando analiza una línea, por ejemplo al usar la orden `read`, bucles `for`, o la expansión de variables.

**PATH**
Controla **dónde busca el sistema los ejecutables** cuando escribes un comando en la terminal. Contiene una lista de **directorios separados por dos puntos** `:`. Es una de las más fundamentales en sistemas GNU/Linux y sistemas tipo Unix.

**HOME**
Representa el **directorio personal de usuario actual**, es decir, el lugar donde el sistema guarda sus archivos, configuraciones y datos personales.

**CDPATH**\
Define una lista de **directorios base** (separados por `:`) donde el comando `cd` buscará si el directorio al que intentas acceder **no se encuentra en el directorio actual**. En otras palabras, hace que `cd` funcione de forma más inteligente, permitiéndote cambiar rápidamente a directorios comunes sin tener que escribir la ruta completa.

**BASH_ENV**\
Sirve para **definir un archivo de configuración que Bash ejecutará automáticamente** al iniciar **shells no interactivas** (por ejemplo, cuando ejecutas un Bash Script).

**MAIL**\
Indica la ubicación del buzón de correo del usuario. Es parte del sisstema de correo local y no afecta al correo electrónico en servicios externos como Gmail.

**MAILCHECK**\
Especifica la frecuencia con la que **Bash** comprueba si hay correos nuevos. El valor predeterminado es 60 s. Si encuentra correo nuevo, la **Bash** puede notificarlo automáticamente en la línea de comandos en **shells interactivas**.

**MAILPATH**\
Permite configurar múltiples buzones de correo para que **Bash** los revise automáticamente en shells interactivas.\
Cada buzón se puede asociar con un **programa o acción** que se ejecuta si se detecta correo nuevo.

En otras palabras, `MAILPATH` es como una **versión extendida** de `MAIL` y `MAILCHECK`, que soporta múltiples buzones y notificaciones personalizadas.
