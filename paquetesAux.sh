# !/bin/bash
#
#  Descripcion : Este programa informa al usuario si un paquete esta
#                instalado o no en la maquina local
#
#

# Se busca el paquete
respuesta=$(dpkg -l|awk '{print $2}'|grep -x $1)

if [ ${#respuesta} -eq 0 ]
	then
		echo "   * El paquete ($1) no esta instalado en la maquina $2$3"
elif [ $respuesta = $1 ]
	then
		echo "   * El paquete ($1) esta instalado en la maquina $2$3 "
fi

