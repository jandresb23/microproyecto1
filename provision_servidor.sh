#!/bin/bash

echo "instalando net-tools"
sudo apt install net-tools -y

echo "instalando vim"
sudo apt install vim

echo "instalando consul"
sudo apt update && sudo apt install consul

#echo "instalando nodejs"
sudo apt install nodejs -y

#echo "instalando aptitude"
sudo apt install aptitude -y

#echo "instalando npm"
sudo apt install npm -y

#echo "instalando git"
#sudo apt install git -y

#echo "clonando repositorio"
#git clone https://github.com/omondragon/consulService.git

#echo “Modificando host con sed”
#sed -i "s/#const HOST='192.168.100.3';/const HOST='192.168.100.2';/g" /home/vagrant/consulService/app/index.js
#sed -i "s/const HOST='[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'/const HOST='192.168.100.2'/" /home/vagrant/consulService/app/index.js

#ingresar a ruta
#cd consulService/app

#echo "instalando consul"
#npm install consul -y

#echo "instalando consul"
#npm install express -y

echo "instalando haproxy"
sudo apt install haproxy -y