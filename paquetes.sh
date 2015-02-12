# !/bin/bash
#
# Flags:
#	* -s (sala a escoger) : sala
#	* -p (paqute a escoger): paquete
#
# Solo se permite en "sala a escoger" los parametros a,e,f y et
# 
# Descripcion del programa:
# 	Este programa dado el nombre de un paquete y el de una sala
# (ambos datos introducidos mediantes flags) realiza ssh en todas las 
# maquinas de la misma y corre el script paqueteAux.sh 
# 
while getopts 'hs:p:' opt
	do
		case $opt in
		s)	
			# Se recive el parametro recibido junto el flag -s (sala)
			sala=$OPTARG
			;;

		p)	
			# Se recibe el parametro recibido junto el flag -p (paquete)
			paquete=$OPTARG
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

if  [ ${#sala} -eq '0' ]||[ ${#paquete} -eq '0' ]
	then	
		# No se han introducido la cantidad de flags correctos
		echo "No ha introducido los flags"
		exit 1
else
	declare -i nMaquinas
	nMaquinas=25
	for ((i=1;i<=nMaquinas;i++))
		do
			ssh invitado@$sala$i.ac.labf.usb.ve bash -s<paquetesAux.sh $paquete $sala $i
		done
fi
