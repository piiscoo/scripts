#!/bin/bash

# Lista de paquetes para instalar
PAQUETES=(
    "vim"
    "curl"
    "git"
    "htop"
    "docker.io"
    "build-essential"
    "apache2"
    "mc"
    "ufw"
)

echo "Instalando paquetes..."
for paquete in "${PAQUETES[@]}"; do
    echo "Instalando $paquete..."
    apt install -y "$paquete"
done

echo "Instalación completa."
