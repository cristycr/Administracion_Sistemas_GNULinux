#! /bin/bash

> arch;
chmod 444 arch;
ls -l arch;

if ! [[ -w arch && -x arch ]]; then
	echo "Permiso wx no indicado.";
elif ! [[ -x arch ]]; then
	echo "Permisos x no indicados.";
fi
