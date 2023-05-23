#!/bin/bash

# Ruta del directorio que contiene las carpetas
directorio="./Configs-PC/brewWsl"

# Obtener la lista de nombres de carpetas
carpetas=$(ls -d "$directorio"/*)

# Iterar sobre las carpetas
for carpeta in $carpetas; do
    # Obtener solo el nombre de la carpeta sin la ruta
    nombre_carpeta=$(basename "$carpeta")

    # Ejecutar el comando brew install con el nombre de la carpeta
    brew install "$nombre_carpeta"

    # Verificar el código de salida del comando (0 para éxito)
    if [ $? -eq 0 ]; then
        echo "Paquete $nombre_carpeta instalado correctamente"
    else
        echo "Error al instalar el paquete $nombre_carpeta"
    fi
done
