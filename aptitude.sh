# !/bin/bash
#
#   * Descripcion :
#   Este programa busca el primer parametro introducido en el script
# en la lista de paquetes instalados de la computadora local, si esta
# instalado se mostrara una lista con todos los paquetes cuyo nombre 
# contiene el nombre del parametro dado, si no esta instalado se muestra
# un mensaje al usuario y se termina la ejecucion del script.
#

respuesta=$(aptitude search ~i $1 --disable-columns -F "%p"|grep -x $1)
if [ ${#respuesta} -eq '0' ]
	then
		echo "El archivo no esta instalado"
		exit 1
else
	aptitude search ~i $1 --disable-columns -F "%p"|grep -w $1 2>/dev/null

fi
