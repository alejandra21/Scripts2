# !/bin/bash
#
#  Flags:
#    * -s (sala dada) : sala
#    * -p (paquete dado): paquete
#
#  Descripcion :
#	Este programa dado los parametros sala y paquetes hace ssh en todas las
#   computadoras de la sala dada y corre el script aptitude.sh
#

while getopts 'hs:p:' opt
	do
		case $opt in
		s)
			sala=$OPTARG
			;;

		p)
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

# Entra aca solo si se ha introducido el nombre de una sala valida
if [ $sala = 'a' ]||[ $sala = 'e' ]||[ $sala = 'f' ]||[ $sala = 'et' ]
	then
		declare -i nMaquinas
		nMaquinas=25

else 
	echo "No ha marcado una opcion valida"
	exit 1
fi

# Se realiza ssh en todas las maquinas
for ((i=1;i<=nMaquinas;i++))
	do
		ssh invitado@$sala$i.ac.labf.usb.ve bash -s<aptitude.sh $paquete
	done
