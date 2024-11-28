#!/bin/bash

# Script para realizar una actualización completa del sistema Linux
# Funciona en distribuciones basadas en Debian/Ubuntu

# Colores para el texto
GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

# Función para manejar errores
error_exit() {
    echo -e "${RED}Error: ${1}${RESET}"
    exit 1
}

# Verificar si se está ejecutando como root
if [ "$EUID" -ne 0 ]; then
    error_exit "Este script debe ejecutarse como root o con sudo."
fi

echo -e "${GREEN}Actualizando la lista de paquetes...${RESET}"
apt update || error_exit "No se pudo actualizar la lista de paquetes."

echo -e "${GREEN}Actualizando los paquetes instalados...${RESET}"
apt upgrade -y || error_exit "No se pudieron actualizar los paquetes."

echo -e "${GREEN}Realizando una actualización completa del sistema...${RESET}"
apt full-upgrade -y || error_exit "No se pudo realizar la actualización completa."

echo -e "${GREEN}Eliminando paquetes y dependencias obsoletas...${RESET}"
apt autoremove -y || error_exit "No se pudieron eliminar paquetes obsoletos."

echo -e "${GREEN}Limpiando la caché de paquetes...${RESET}"
apt clean || error_exit "No se pudo limpiar la caché de paquetes."

echo -e "${GREEN}Comprobando si hay actualizaciones del kernel o reinicios pendientes...${RESET}"
if [ -f /var/run/reboot-required ]; then
    echo -e "${RED}Es necesario reiniciar el sistema para aplicar las actualizaciones.${RESET}"
else
    echo -e "${GREEN}No se necesita reiniciar el sistema.${RESET}"
fi

echo -e "${GREEN}Actualización completa. El sistema está actualizado.${RESET}"
