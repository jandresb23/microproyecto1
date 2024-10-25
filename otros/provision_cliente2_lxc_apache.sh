#!/bin/bash

echo "aprovisionamiento para cliente2"

#echo "instalar Consul"
#sudo apt update && sudo apt install consul -y

echo "configuracion lxd"
lxd init

echo "lanzar contenedor e instalar apache2"

# Lanzar el contenedor
lxc launch ubuntu:22.04 web2

# Esperar a que el contenedor esté en estado RUNNING
for i in {1..100}; do
    STATUS=$(lxc info web2 | grep Status | awk '{print $2}')
    if [ "$STATUS" = "RUNNING" ]; then
        echo "El contenedor está en ejecución."
        break
    fi
    #echo "Esperando a que el contenedor se inicie... Intento $i de 30"
    sleep 1
done

# Si el contenedor no está en ejecución después de 100 segundos, mostrar un mensaje de error
if [ "$STATUS" != "RUNNING" ]; then
    echo "Error: El contenedor no se inició en el tiempo esperado."
    exit 1
fi

echo "instalar Consul en contenedor"
lxc exec web2 -- bash -c "
  wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

  echo 'deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main' | tee /etc/apt/sources.list.d/hashicorp.list

  apt install -y consul
"
#echo "habilitar Consul"
#lxc exec web2 -- bash -c "systemctl enable consul && systemctl start consul"

echo "instalar Apache2 en contenedor"
lxc exec web2 -- bash -c "apt install -y apache2 && systemctl enable apache2 && echo 'Hello from web2' > /var/www/html/index.html && systemctl start apache2"
