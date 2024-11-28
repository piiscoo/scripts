#!/bin/bash

# Lista de paquetes para instalar
PAQUETES=(
    "vim"
    "curl"
    "git"
    "htop"
    "docker.io"
    "build-essential"
)

echo "Instalando paquetes..."
for paquete in "${PAQUETES[@]}"; do
    echo "Instalando $paquete..."
    apt install -y "$paquete"
done

echo "Instalación completa."
