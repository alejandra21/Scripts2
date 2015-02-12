# !/bin/bash
#
#  Flags :
#
#     -d (directorio dado) : directorio
#
#  Descripcion :
#	Este programa si no recibe ningun parametro muestra todos los
#   directorios de la variable PATH. Si recibe un parametro mediante un
#   flag entonces informara al usuario si el directorio ingresado forma 
#   parte de unos de los directorios que se encuentran en dicha variable
#   (la variable PATH).
#

while getopts 'hd:' opt
	do
		case $opt in
		d)
			directorioDado=$OPTARG
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

# Numero de directores en la variable PATH
declare -i NumeroDirectorio
NumeroDirectorio=$(echo -e ${PATH//:/'\n'}|wc -l)

if [ ${#directorioDado} -eq '0' ]
	then
	# Si no se introduce ningun parametro se mostraran todos los directorios de la variable
	# PATH.
	for ((i=1;i<=NumeroDirectorio;i++))
		do
			directorio=$(echo -e ${PATH//:/'\n'}|sed -n "$i p")
			echo " "
			echo $directorio
			ls $directorio
		done
else
	# Si se introduce algun parametro junto con el flag -d entonces se buscara si el directorio
	# forma parte de los directorios en la variable PATH

	for ((i=1;i<=NumeroDirectorio;i++))
		do
			directorio=$(echo -e ${PATH//:/'\n'}|sed -n "$i p")
			if [ $directorio = $directorioDado ]
				then
				echo "El directorio $directorioDado esta en el PATH"
				exit 1
			fi

		done

	echo "El directorio no esta en el PATH"

fi

