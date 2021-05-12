#!/bin/bash

#menu

opciones="Verificar Ensamblar CrearGIF Salir"

function verificar {
	echo "Ingrese ruta de acceso a las imagenes"
	read directorio

	if [[ -d $directorio]]; then
		echo "La ruta existe y es: $directorio"
		cd $directorio
		echo "Kbytes  Archivos.png"
		f=s(ls -sh *.png)
		for i in f;
		do
			# l=$(($l+1))
			echo $f
		done
	elif [[-f $directorio]];then
		echo "Es una ruta... pero de un archivo"
	fi

}

function ensamblar{
	echo "Hola! Ahora trabajaremos desde APNG Assembler	(apngasm)"

	if [[-d $directorio]]; then
		echo "La ruta es: $directorio"
		cd $directorio
		echo "Archivos.png"
		f=$(ls *.png)
		for ((i=0; i<7; i++));
		do
			#l = $(($l+1))
			echo $f
		done
		echo "Ingrese el nombre del archivo de salida"
		read file_name
		echo "Ingrese el retraso o delay"
		read file_delay
		echo "Ingrese la cantidad de ciclos a animar"
		read file_frame

		apngasm -o $file_name.png $f $file_delay -l$file_frame
		a=$(pwd)
		if [-d "$a/PNG2GIFT"]; then
			echo "La carperta PNG2GIFT existe"
		else
			mkdir $a/PNG2GIFT
			echo "Se ha creado la ruta $a/PNG2GIFT"
		fi
		mv $file_name.png $a/PNG2GIFT
	elif [[ -f $directorio ]];then
		echo "Es una ruta ... pero de un archivo"
	fi

}


function crear_GIF{
	echo "Hola! ahora crearemos un gif (apn2gif)"

	if [[ -d $directorio ]]; then
		cd directorio
		b=$(pwd)
		if [ -d $b/PNG2GIFT ];then
			echo "La carperta PNG2GIFT existe"
		else
			mkdir $b/PNG2GIFT
			echo "Se ha creado la ruta $b/PNG2GIFT"
		fi

		c="$b/PNG2GIFT"
		echo "Ruta en la que estamos $c"
		cd $c
		echo "Archivos.png"
		f=$(ls *.png)
		
		for ((i=0; i<1; i++));
		do
			echo "$f"
		done
		
		echo "Seleccione de la lista el archivo a trabajar y escribalo en el siguiente campo"
		echo "ingrese el nombre del archivo de entrada"
		read file_in_name
		echo "ingrese el nombre del archivo de salida"
		read file_out_name

		apng2gif $file_in_name.png $file_out_name.gif
		mv $file_out_name.gif $c
	elif [[ -f $directorio ]]; then
		echo "Es una ruta...pero de un archivo"
	fi
}

echo "Bienvenido a Manejo de Archivos en BASH!"
echo "Ahora, selecciona una opciรณn de nuestro menu"
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
		echo "Opcion no valida!"
	fi
done
}
