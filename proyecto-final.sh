#!/bin/bash
clear
echo -e " \e[1;34m       _____                                           "
echo "      (_____ \                                       _             "
echo "       _____) )  ____   ___   _   _  _____   ____  _| |_   ___     "
echo "      |  ____/  / ___) / _ \ | | | || ___ | / ___)(_   _) / _ \    "
echo "      | |      | |    | |_| || |_| || ____|( (___   | |_ | |_| |   "
echo "      |_|      |_|     \___/  \__  ||_____) \____)   \__) \___/    "
echo "                         ___  (____/           _                   "
echo "                        / __)(_)              | |                  "
echo "                      _| |__  _  ____   _____ | |                  "
echo "                     (_   __)| ||  _ \ (____ || |                  "
echo "                       | |   | || | | |/ ___ || |                  "
echo "                       |_|   |_||_| |_|\_____| \_)                 "
echo "                                                                   "
echo -e "\e[1;32m"
echo " *************************************************************************"
echo " *  1- Instalar e iniciar un servidor web nginx                        ***"
echo " *                                                                     ***"
echo " *  2- Instalar e iniciar un servidor http                             ***"
echo " *                                                                     ***"
echo " *  3- Consultar el release del sistema                                ***"
echo " *                                                                     ***"
echo " *  4- Consultar el servidor dns del servidor                          ***"
echo " *                                                                     ***"
echo " *  5- Consultar el gateway del servidor                               ***"
echo " *                                                                     ***"
echo " *  6- Consultar el estado de setlinux                                 ***"
echo " *                                                                     ***"
echo " *  7- Listar las opciones del firewall                                ***"
echo " *                                                                     ***"
echo " *  8- Mostrar la informacion del archivo /etc/passwd                  ***"
echo " *                                                                     ***"
echo " *  9- Imprimir un mensaje con el parametro ingresado                  ***"
echo " *                                                                     ***"
echo " * 10- Listar los discos duros del servidor                            ***"
echo " *                                                                     ***"
echo " * 11- Saber el tiempo que lleva prendido el servidor                  ***"
echo " *                                                                     ***"
echo " * 12- Conocer los procesos del servidor                               ***"
echo " *                                                                     ***"
echo " * 13- Modificar index Nginx                                           ***"
echo " *                                                                     ***"
echo " * 14- Modificar index Http                                            ***"
echo " *                                                                     ***"
echo " * 15- Salir                                                           ***"
echo " *************************************************************************"
while true; do
read -p " Introduce el numero de la opcion elegida: " opcion;
case $opcion in
      1)clear
             echo -e "\e[1;34m  \n\tTIP:Ngnix nacio como un intento de solucionar el problema C10k es el
            reto de gestionar diez mil conexiones al mismo tiempo, ademas maneja una arquitectura
            sincronica y controlada por eventos\n"
             sleep 5
                    sudo yum install epel-release -y # usado para instalar paquete de sofware de terceros
                    sudo yum repolist -y  # recupera e instala actualizacione y aplicaciones del sistema operativo
                    sudo service httpd stop # pone en stop el servidor httpd
                    sudo systemctl disable httpd # quita el auto-arranque ya que no se usaron puertos diferentes puede causar errores
                    sudo yum install nginx -y # instala nginx
                    sudo systemctl start nginx # inicia el servicio de nginx
                    sudo systemctl enable nginx # iniciar servicio automaticamente si se reinicia el equipo
                    sudo systemctl status nginx;; # muestra el estado del servicio
      2)clear
             echo -e "\e[1;34m  \n\tTIP:HTTP Apache debe su nombre a que alguien queria que tuviese la connotacion
            de algo que es firme y energico pero no egresivo, y la tribu Apache fue la ultima en rendirse 
            al que se convertiria en el gobierno de estados unidos\n"
             sleep 5
                   sudo systemctl stop nginx # pone en stop el servidor ngnix
                   sudo systemctl disable nginx # dasabilita el autoarranque del servidor nginx
	           sudo yum install httpd -y # instala el servidor httpd
	           sudo service httpd start #inicia el servidor httpd
	           sudo systemctl enable httpd;;# iniciar servicio automaticamente si se reinicia
	          # sudo systemctl status httpd;; #muestra el estado del servicio
      3)clear
              echo -e "Consultando release del sistema\n"
             sleep 3
                    sudo cat /etc/*release;; # nos mostrara la arquiteectura del SO
      4)clear
             echo -e "Consultando servidor DNS del servidor\n"
             sleep 3
                    sudo cat /etc/resolv.conf;; # se encarga de configurar parte del sistema de resolucion de nombres de dominio
      5)clear
             echo -e "Consultando gateway del servidor\n"
             sleep 3
                    sudo route -n;; # este comando permite gestionar todo lo relacionado a la tabla de enrutamiento
      6)clear
              echo -e "\e[1;34m  \n\tTIP:Security-Enhanced Linux. mejor conocido como SELinux es un mecanismo de seguridad 
            de control de acceso obligatorio, tiene 3 modos basicos de funcionamiento, de los
            cuales Enforcing se establece como el modo por defecto de instalacion\n"
             sleep 5
                    sudo getenforce;; # devuleve el estado de SELinux: Enforcing, permisive o disbled /etc/selinux/config:
      7)clear
              echo -e "Listando opciones del firewall\n"
             sleep 3
                    sudo yum install firewalld # Es simplemente un contenedor de iptables que permite un manejo más sencillo que iptables
                    sudo firewall-cmd --list-all;; # Ver las reglas que se aplican actualmente
      8)clear
             echo -e "Mostrar informacion del archivo /etc/passwd\n"
             sleep 3
                    sudo cat /etc/passwd;; #Contiene una lista de las cuentas del sistema, que proporciona información útil para cada
                                           #cuenta, como ID de usuario, ID de grupo, directorio de inicio, shell y más
      9)clear
            echo -e "\e[1;34m  \n\tTIP:El comando read lee su entrada estandar y asigna
            las palabras leidas en la(a) variable(s) cuyo nombre
            se pasan por argumento \n"
                    sleep 5
                    echo -e "\e[1;32m Introduce el mensaje a imprimir: \n "
                    read var1
                    echo -e "\n Mensaje escrito : " $var1;;
      10)clear
             echo -e "Listando los discos duros del sistema\n"
             sleep 3
                    sudo lsblk;; #listar los discos duros del sistema
      11)clear
              echo -e "Consultando tiempo que lleva prendido el servidor\n"
             sleep 3
                    sudo uptime;; #siguiente información: la hora actual, cuanto tiempo lleva en marcha el sistema sin interrupción,
                                  #el número de usuarios actualmente conectados al sistema, y la carga media del sistema
      12)clear
              echo -e "Buscando los procesos activos del servidor\n"
             sleep 3
                    sudo top;; # Permite ver las tareas que se estan ejecutando  kill -9
                    # sudo top -n1 #muestra las tareas pero solo muestra no sigue en tiempo real
      13) clear  # modificar index del servidor Nginx
                echo -e "\e[1;34m  \n\tTIP:Recuerda que el index maneja etiquetas HTML
            en caso de dañar el archivo se ha creado una copia
            llamada indexCopia.hml en la ruta /usr/share/nginx/html \n"

             sleep 5
                    sudo cp -a  /usr/share/nginx/html/index.html  /usr/share/nginx/html/indexCopia.html
                    echo -e "copia creada con exito \n"

             sleep 2
                    sudo nano /usr/share/nginx/html/index.html;;

       14) clear #modificar index del servidor httpd
               echo -e "\e[1;34m  \n\tTIP:Recuerda que el index maneja etiquetas HTML
            en caso de dañar el archivo se ha creado una copia
            llamada indexCopia.html en la ruta /usr/share/httpd/noindex/index.html \n"

             sleep 5
                    sudo cp -a  /usr/share/httpd/noindex/index.html  /usr/share/httpd/noindex/indexCopia.html
                    echo -e "copia creada con exito \n"
             sleep 2
                    sudo nano /usr/share/httpd/noindex/index.html;;
      15) exit;; #salir
*) clear
 echo -e "\e[1;34m  \n \t\t OPCION INVALIDA \n ejecute nuevamente e intente con un parametro valido  \n "
echo -e "\e[1;32m"
echo " *************************************************************************"
echo " *  1- Instalar e iniciar un servidor web nginx                        ***"
echo " *                                                                     ***"
echo " *  2- Instalar e iniciar  un servidor http                            ***"
echo " *                                                                     ***"
echo " *  3- Consultar el release del sistema                                ***"
echo " *                                                                     ***"
echo " *  4- Consultar el servidor dns del servidor                          ***"
echo " *                                                                     ***"
echo " *  5- Consultar el gateway del servidor                               ***"
echo " *                                                                     ***"
echo " *  6- Consultar el estado de setlinux                                 ***"
echo " *                                                                     ***"
echo " *  7- Listar las opciones del firewall                                ***"
echo " *                                                                     ***"
echo " *  8- Mostrar la informacion del archivo /etc/passwd                  ***"
echo " *                                                                     ***"
echo " *  9- Imprimir un mensaje con el parametro ingresado                  ***"
echo " *                                                                     ***"
echo " * 10- Listar los discos duros del servidor                            ***"
echo " *                                                                     ***"
echo " * 11- Saber el tiempo que lleva prendido el servidor                  ***"
echo " *                                                                     ***"
echo " * 12- Conocer los procesos del servidor                               ***"
echo " *                                                                     ***"
echo " * 13- Modificar index                                                 ***"
echo " *                                                                     ***"
echo " * 14- Modificar index Http                                            ***"
echo " *                                                                     ***"
echo " * 15- Salir                                                           ***"
echo " *************************************************************************";;
esac
done





