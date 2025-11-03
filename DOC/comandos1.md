# COMANDOS DE BASH

## INTRODUCCIÓN

La **bash (Bourne Again Shell)** es la interfaz de línea de comandos más utilizada en sistemas\
Linux y Unix. Permite ejecutar programas, automatizar tareas mediante scripts y administrar el\
sistema de forma eficiente.\
Dominar los comandos de Bash es esencial para cualquier administrador de sistemas o usuario\
avanzado de Linux.

A continuación, encontrarás una recopilación de comandos esenciales, intermedios y avanzados,\
organizados por temática y complejidad creciente.

## COMANDOS BÁSICOS DE NAVEGACIÓN Y GESTIÓN DE ARCHIVOS

> [!NOTE]
> Nivel principiante.\
> Estos comandos permiten moverse por el sistema de ficheros y manipular archivos y directorios.

| Comando | Función | Ejemplo |
| --- | --- | --- |
| `pwd` | Muestra el directorio actual de trabajo | `pwd` |
| `ls` | Lista archivos y directorios | `ls -l` |
| `cd` | Cambia de directorio | `cd /etc` |
| `mkdir` | Crea un nuevo directorio | `mkdir temporal` |
| `rmdir` | Elimina un directorio **vacío** | `rmdir temporal` |
| `cp` | Copia archivos o directorios | `cp archivo /archivo.backup` |
| `mv` | Mueve o renombra archivos | `mv viejo nuevo` |
| `rm` | Elimina ficheros | `rm fichero.txt` |
| `touch` | Crea un archivo vacío o actualiza su fecha | `touch apuntes.txt` |
| `cat` | Muestra el contenido de un fichero | `cat apuntes` |
| `less/more` | Muestra contenido de forma paginada | `less /etc/passwd` |
| `file` | Muestra el tipo de fichero | `file imagen.png` |

## BÚSQUEDA Y FILTRACIÓN DE INFORMACIÓN

> [!NOTE]
> Nivel intermedio
> Estos comandos permiten localizar archivos, buscar texto y filtrar resultados.

| Comando | Función | Ejemplo |
| --- | --- | --- |
| `find` | Busca ficheros o directorios por nombre o tipo | `find /home -name "*.txt"` |
| `locate` | Busca ficheros en la base de datos del sistema | `locate bashrc` |
| `grep` | Busca texto denrto de ficheros | `grep "error" /var/log/syslog"` |
| `sort` | Ordena líneas de texto | `sort nombres` |
| `uniq` | Elimina duplicados consecutivos | `uniq lista.txt` |
| `wc` | Cuenta líneas, palabras y caracteres | `wc -l archivo` |
| `head/tail` | Muestra las primeras o últimas líneas | `tail -n 20 log.txt` |
| `cut` | Extrae secciones de texto | `cut -d: -f1 /etc/passwd` |
| `awk` | Procesa texto por patrones | `awk '{print $1}' lista.txt` |
| `sed` | Edita texto en línea | `sed 's/error/ok/g' log.txt` |

## ADMINISTRACIÓN DEL SISTEMA

> [!NOTE]
> Nivel intermedio-avanzado
> Permiten gestionar procesos, usuarios, permisos y recursos del sistema.
> Si sabes usarlos, ya te vas pareciendo más a un auténtico administrador de sistemas.

| Comando | Función | Ejemplo |
| --- | --- | --- |
| `ps` | Muestra procesos activos | `ps aux` |
| `top/htop` | Muestra procesos en tiempo real | `top` |
| `kill` | Finaliza procesos por PID | `kill 1234` |
| `chmod` | Cambia permisos de ficheros y directorios | `chmod 755 script.sh` |
| `chown` | Cambia propiedad de ficheros y directorios	| `chown usuario:grupo comandos1.md` |
| `df` | Muestra el uso del disco | `df -h` |
| `du` | Muestra el tamaño de directorios | `du -sh /var/log` |
| `free` | Muestra el uso de memoria | `free -m` |
| `uptime` | Muestra el tiempo encendido del sistema | `uptime` |
| `who/w` | Muestra usuarios conectados | `who` |
| `sudo` | Ejecuta comandos escalando a permisos de root | `sudo apt update` |

## RED Y CONECTIVIDAD

> [!NOTE]
> Nivel intermedio-avanzado
> Para comprobar y gestionar la conectividad de red y servicios.

| Comando | Función | Ejemplo |
| --- | --- | --- |
| `ping` | Comprueba la conectividad con otro host | `ping 192.168.1.1` |
| `curl` | Realiza peticiones HTTP | `curl -I https://prueba.com` |
| `wget` | Descarga archivos desde Internet | `wget https://prueba.com/script.sh` |
| `netstat` | Muestra conexiones y puertos abiertos | `netstat -tulnp` |
| `ss` | Alternativa moderna a `netstat` | `ss -ltn` |
| `ip` | Configura interfaces de red | `ip a` |
| `traceroute` | Rastrea la ruta a un host | `traceroute google.com` |
| `scp` | Copia archivos entre equipos por SSH | `scp fichero usuario@host:/path/`
| `rsync` | Sincroniza ficheros o directorios | `rsync -av tmp/ temporal/` |
| `ssh` | Establece conexión con un sistema remoto | `ssh usuario@host` |

## COMPRESIÓN, EMPAQUETADO Y BACKUPS

> [!NOTE]
> Nivel intermedio-avanzado

| Comando | Función | Ejemplo |
| --- | --- | --- |
| `tar` | Crea o extrae archivos comprimidos | `tar -czvf backup.tar.gz /home/user` |
| `gzip/gunzip` | Comprime o descomprime archivos | `gzip fichero.txt` |
| `bzip2/bunzip2` | Mayor compresión que zip, pero más lento | `bzip2 archivo.txt` |
| `zip/unzip` | Crea o extrae archivos ZIP | `zip -r backup.zip temporal/` |
| `7z/7za` | Alta compresión (usa LZMA/LZMA2) | `7z a backup.7z temporal/` |
| `dd` | Copia y convierte datos (backups de discos) | `dd if=/dev/sda of=/backup.img` | 

## SHELL SCRIPTING Y AUTOMATIZACIÓN

> [!NOTE]
> Nivel avanzado
> Permite combinar comandos y automatizar tareas mediante la creación de scripts.

| Comando | Función | Ejemplo |
| --- | --- | --- |
| `echo` | Imprime texto | `echo "Hola mundo"` |
| `read` | Lee y guarda la entrada en una variable | `read nombre` |

Si quieres ver más sobre Bash Scripting, consulta la guía de [gramática de la Bash](DOC/gramatica.md).

## UTILIDADES Y TRUCOS ÚTILES

> [!NOTE]
> Nivel intermedio
> Estos comandos ayudan a consultar información del sistema, buscar herramientas, crear atajos,/
> y mejorar la productividad en la terminal.

### Información sobre comandos y ayuda

| Comando | Función | Ejemplo |
| --- | --- | --- |
| `man` | Muestra manuales de ayuda | `man grep` |
| `info` | Manual detallado (suele ser más extenso que man) | `info ls` |
| `help` | Muestra ayuda de comandos internos de bash | `help cd` |
| `whatis` | Muestra una breve descripción de un comando | `whatis tree` |
| `apropos` | Busca coincidencias en páginas de manual | `apropos regex` |
| `which` | Muestra la ruta del ejecutable de un comando | `which apropos` | 
| `whereis` | Localiza el binario, fuente y manual de comando | `whereis find` |
| `type` | Indica si algo es alias, función o binario | `type tree` |

### Información del usuario y sistema

| Comando | Función | Ejemplo |
| --- | --- | --- |
| `whoami` | Muestra el usuario actual | `whoami` |
| `who/w` | Muestas los usuarios conectados | `who` |
| `id` | Muestra UID, GID y grupos del usuario | `id` |
| `groups` | Lista los grupos del usuario | `groups` |
| `hostname` | Muestra o cambia el nombre del host | `hostnamectl` |
| `neofetch` | Un Script personalizable con información del sistema | `neofetch` |
| `uptime` | Muestra tiempo encendido del sistema | `uptime` |
| `last` | Registro de últimos inicios de sesión | `last` |
| `history` | Muestras el historial de comandos ejecutados | `history` |
| `uname` | Muestra información del sistema | `uname -a` |

### Productividad y atajos en la terminal

| Utilidad | Función | Ejemplo |
| --- | --- | --- |
| `alias` | Comando que crea atajos de comandos	| `alias ll='ls -la'` |
| `unalias` | Comando que elimina un alias | `unalias ll` |
| `clear / ^L` | Limpia la línea de comandos | `clear` |
| `history -c` | Limpia el historial | `history -c` |
| `!!` | Repite el último comando ejecutado | `!!` |
| `!n` | Repita el comando N del historial | `!50` |
| `^R` | Búsqueda interactiva en el historial | - |
| `pushd/popd` | Cambia de directorio rápidamente | `pushd /etc` |
| `dirs` | Lista la pila de directorios	| `dirs` |
| `tree` | Lista directorios en formato ramificado | `tree /home` |

### Fecha, hora y utilidades varias

| Comando | Función | Ejemplo |
| --- | --- | --- |
| `date` | Muesra o ajusta la fecha/hora | `date "+%Y-%m-%d %H:%M"` |
| `cal` | Muestra el calendario | `cal 2025` |
| `bc` | Calculadora de línea de comandos | `bc; 2+3` | 
| `expr` | Evalúa expresiones aritméticas o lógicas | `expr 5 \* 2` |
| `seq` | Genera secuencias de números | `seq 1 10` | 
| `sleep` | Espera un tiempo antes de continuar | `sleep 5` |
| `time` | Mide cuánto tarda un comando en ejecutarse | `time ls -R /` |

### Manipulación de texto rápida

| Comando | Función | Ejemplo |
| --- | --- | --- |
| `tr` | Sustituye o elimina caracteres	| `tr a-z A-Z < texto.txt` |
| `rev` | Invierte líneas de texto | `rev; hola` |
| `nl` | Numera las líneas de un archivo | `nl script.sh` | 
| `paste` | Une líneas de archivos | `paste p1.txt p2.txt` | 
| `join` | Combina archivos por campos comunes | `join p1 p2` | 
| `split` | Divide ficheros grandes en pequeñas secciones | `split -b 100M archivo.iso parte_` | 
| `tee` | Muestra y guarda la salida a la vez | `tee;ls` |
| `cut` | Divide ficheros línea por línea por un delimitador dado | `cut -d: -f1 /etc/passwd` |

