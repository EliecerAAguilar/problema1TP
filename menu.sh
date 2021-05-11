#!/bin/bash

#menu
opciones="Verificar Ensamblar Crear_GIF Salir"
function verificar {
	echo "Ingrese ruta de acceso a las imágenes"
		read directorio
		#directorio="/home/erod10/"
		if [[ -d $directorio ]]; then
			echo "La ruta existe y es: $directorio"
			echo "Kbytes	Archivos.png"
			f=$(ls -sh *.png)
			for i in f;
			do
# 				l=$(($l+1))
				echo "$f"
			done
		elif [[ -f $directorio ]]; then
			echo "Es una ruta...pero de un archivo"
		fi
}

function ensamblar {
	echo "Hola! Ahora trabajaremos desde APNG Assembler (apngasm)"
	if [[ -d $directorio ]]; then
			echo "La ruta existe y es: $directorio"
			echo "Archivos.png"
			f=$(ls -sh *.png)
			for i in f;
			do
				# l=$(($l+1))
				echo $f
			done
		elif [[ -f $directorio ]]; then
			echo "Es una ruta...pero de un archivo"
		fi
	echo "ingrese el nombre del archivo de salida"
	read file_name
	echo "ingrese el retraso o delay"
	read file_delay
	echo "ingrese cantidad de ciclos a animar"
	read file_frame

	apngasm -o $file_name.png $f $file_delay -l$file_frame
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
