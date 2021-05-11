#!/bin/bash

#menu
opciones="Verificar Ensamblar Crear_GIF Salir"
function verificar {
	echo "Ingrese ruta de acceso a las imágenes"
		read directorio
		#directorio="/home/erod10/"
		if [[ -d $directorio ]]; then
			echo "La existe y la ruta es: "$(pwd)
			echo "Kbytes	Archivos.png"
			f=$(ls -sh *.png)
			for i in f;
			do
				l=$(($l+1))
				echo "$f"
			done
		elif [[ -f $directorio ]]; then
			echo "Es una ruta...pero de un archivo"
		fi
}

function ensamblar {
	echo "Hola desde la funcion!"
}

function crear_GIF {
	echo "Hola desde la funcion!"
}

echo "Selecciona una opción de nuestro menu"
select opcion in $opciones;
do
	if [ $opcion = "Verificar" ]; then
		verificar
	elif [ $opcion = "Ensamblar" ]; then
		ensamblar 
	elif [ $opcion = "Crear_GIF" ]; then
		crear_GIF
	elif [ $opcion = "Salir" ]; then
		echo "Bye!"
		exit
	else
		echo "Opcion no válida!"
	fi
done