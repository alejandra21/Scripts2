Instrucciones para correr los scripts:

 - Los script que se deben correr son:

	* paquetes.sh:
				Script que dice si un paquete esta instalado en las maquinas de una sala o no
	* idioma.sh :
				Script que cambia el idioma de los teclados de las maquinas de una sala
	* PATH.sh:
				Script que lista el contenido de todos los directorios de la variable PATH
	* aptitudeAux.sh :
				 Script que usa del comando aptitude para buscar archivos

Nota:
	Los scripts paquetesAux.sh y aptitude.sh son scripts auxiliares utilizados
por paquetes.sh y aptitudeAux.sh respectivamente.

--------------------------------------------------------------------------

Instrucciones para correr paquetes.sh:

 Para correr este script se debe escribir en consola 
 ./paquetes.sh -s <Nombre de la sala (a/e/f/et)> -p <nombre del paquete a buscar>
 
 Ejemplo:
 
	./paquetes.sh -s a -p eclipse
 
 ------------------------------------------------------------------------
 Instrucciones para correr idioma.sh:
 
 
 Para correr este script se debe escribir en consola 
 ./idioma.sh -s <Nombre de la sala (a/e/f/et)> -i <us/es> -m <ip/dominio>
 
 Ejemplo :
 
	./idioma.sh -s a -i us -m ip
	./idioma.sh -s a -i es -m dominio
	
 ------------------------------------------------------------------------
 Instrucciones para correr PATH.sh:
 
 
 Para correr este script se debe escribir en consola 
 ./PATH.sh -d <Nombre del directorio> o ./PATH.sh
 
 Ejemplo :
 
 ./PATH.sh -d /usr/games
 ./PATH.sh
 
  ------------------------------------------------------------------------
 Instrucciones para correr aptitudeAux.sh:
 
 
 Para correr este script se debe escribir en consola 
 ./aptitudeAux.sh -s <Nombre de la sala (a/e/f/et)> -p <nombre del paquete a buscar>
 
 Ejemplo :
 
./aptitudeAux.sh -s a -p eclipse
 
 


 
