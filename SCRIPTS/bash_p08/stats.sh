#!/bin/bash

while IFS='|' read -r nombre clase promedio; do
	printf "%-15s %-10s %10s\n" "$nombre" "$clase" "$promedio"
done < alumnos.txt
