#!/bin/bash

# Script para monitorizar recursos del sistema
SALIDA="/var/log/monitor_sistema.log"

echo "---- Monitorización del sistema: $(date) ----" >> "$SALIDA"
echo "Uso de CPU:" >> "$SALIDA"
mpstat >> "$SALIDA"

echo "Uso de RAM:" >> "$SALIDA"
free -h >> "$SALIDA"

echo "Espacio en disco:" >> "$SALIDA"
df -h >> "$SALIDA"

echo "Conexiones activas:" >> "$SALIDA"
ss -tuln >> "$SALIDA"

echo "Monitorización completada. Datos guardados en $SALIDA"
