#!/bin/bash

# Script de mantenimiento completo del sistema

# Colores para el texto
GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

# Verificar si se ejecuta como root
if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}Este script debe ejecutarse como root o con sudo.${RESET}"
    exit 1
fi

echo -e "${GREEN}1. Actualizando sistema...${RESET}"
apt update && apt full-upgrade -y

echo -e "${GREEN}2. Limpiando paquetes y dependencias obsoletas...${RESET}"
apt autoremove -y && apt clean

echo -e "${GREEN}3. Comprobando errores en el disco...${RESET}"
fsck -Af -y

echo -e "${GREEN}4. Verificando reinicio pendiente...${RESET}"
if [ -f /var/run/reboot-required ]; then
    echo -e "${RED}Reinicio necesario. Reiniciando en 10 segundos...${RESET}"
    sleep 10
    reboot
else
    echo -e "${GREEN}No se necesita reiniciar. Mantenimiento completo.${RESET}"
fi
