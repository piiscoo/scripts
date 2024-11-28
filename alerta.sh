#!/bin/bash

# Umbrales
LIMITE_DISCO=90
LIMITE_RAM=90

# Verificar uso de disco
USO_DISCO=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

if [ "$USO_DISCO" -gt "$LIMITE_DISCO" ]; then
    echo "Alerta: Uso de disco al $USO_DISCO%" | mail -s "Alerta de disco lleno" tu_email@example.com
fi

# Verificar uso de RAM
USO_RAM=$(free | grep Mem | awk '{print $3/$2 * 100.0}' | awk -F. '{print $1}')

if [ "$USO_RAM" -gt "$LIMITE_RAM" ]; then
    echo "Alerta: Uso de RAM al $USO_RAM%" | mail -s "Alerta de RAM alta" tu_email@example.com
fi
