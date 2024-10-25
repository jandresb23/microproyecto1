#!/bin/bash

echo "instalando net-tools"
sudo apt install net-tools -y

echo "instalando vim"
sudo apt install vim

echo "instalando consul"
sudo apt update && sudo apt install consul -y
