# !/bin/bash
#
#  Flags:
#      * -s (sala dada) : sala
#      * -i (idioma dado): idioma
#      * -m  (ip/dominio): modalidad para recorrer las maquinas
#
#  Descripcion:
#     Este prgrama dado tres parametros (sala, idioma y modalidad para recorrer
#  las computadoras de una sala) cambia el idioma del teclado en todas las maquinas 
#  de una sala 
#

while getopts 'hs:i:m:' opt
	do
		case $opt in
		s)
			sala=$OPTARG
			;;
		i)
			idioma=$OPTARG
			;;
		m)
			modalidad=$OPTARG
			;;

		\?)
			echo "Invalid"
			exit 1
			;;
		:)
			echo "Exit"
			exit 1
		esac
	done

# Si no se coloca alguno de los flags se cierra el script
if [ ${#sala} -eq '0' ]||[ ${#idioma} -eq '0' ]||[ ${#modalidad} -eq '0' ]
	then
		echo "No se han introducido todos los flags"
else

	if [ $idioma = 'us' ]||[ $idioma = 'es' ]
		then
		# Se declaran el rango de la ip de la primera maquina de las salas
		if [ $sala = 'a' ]
			then
			declare -i rango=2

		elif [ $sala = 'e' ]
			then
			declare -i rango=27

		elif [ $sala = 'f' ] 
			then
			declare -i rango=52


		elif [ $sala = 'et' ]
			then
			declare -i rango=77

		else
			echo "Los datos ingresados en el flag sala no son validos"
			exit 1
		fi

		declare -i nMaquinas
		nMaquinas=25 

		if [ $modalidad = 'ip' ]
			then
			# Se recorren las maquinas por ip
			for ((i=1;i<nMaquinas;i++))
				do
					ssh root@159.90.9.$rango loadkeys $idioma
					rango=$rango+1
				done

		elif [ $modalidad = 'dominio' ]
			then
			# Se recorren las maquinas por dominio
			for ((i=1;i<=nMaquinas;i++))
				do
					ssh root@$sala$i.ac.labf.usb.ve loadkeys $idioma
		
				done
		else
			echo "No ha introducido una opcion correcta en el flag modo "
			exit 1
		fi

	else
		echo "La informacion brindada no esta en ninguna de las opciones"
		exit 1
	fi
fi
