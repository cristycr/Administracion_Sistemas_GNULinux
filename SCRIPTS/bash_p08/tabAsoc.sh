#!/bin/bash

# Crea un script que cuente el número de habitantes por ciudad.

cut -d "|" -f3 datos.txt | sort | uniq -c | awk '{count=$1; $1=""; print substr($0,2) " => " count}'
