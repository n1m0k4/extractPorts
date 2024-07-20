#!/bin/bash

# Nombre del archivo temporal
TMP_FILE="extractPorts.tmp"

# Definición de códigos ANSI para formato
BOLD_ON='\033[1m'
RESET='\033[0m'
GREEN='\033[0;32m'

# Verificación de parámetros
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <archivo_de_salida_de_nmap>"
    exit 1
fi

NMAP_FILE="$1"

# Verifica que el archivo de nmap existe
if [ ! -f "$NMAP_FILE" ]; then
    echo "El archivo $NMAP_FILE no existe."
    exit 1
fi

# Extracción de IP y puertos
IP=$(grep -m 1 -oP '(?<=Nmap scan report for )[^ ]+' "$NMAP_FILE")
PORTS=$(grep -oP '^\d+(?=/tcp)' "$NMAP_FILE" | paste -sd ',' -)

# Verificación de que se encontraron puertos
if [ -z "$PORTS" ]; then
    echo "No se encontraron puertos abiertos en el archivo $NMAP_FILE."
    exit 1
fi

# Crear archivo temporal
{
    echo -e "${BOLD_ON}[*] Host:${RESET} $IP"
    echo ""
    echo -e "${BOLD_ON}[*] Puertos abiertos:${RESET} $PORTS"
    echo ""
    echo ""
    echo -e "${GREEN}[!] Puertos copiados a la clipboard con éxito [!]${RESET}"
} > "$TMP_FILE"

# Mostrar el contenido del archivo temporal
/usr/bin/batcat "$TMP_FILE"

# Copiar los puertos al portapapeles (ajusta según tu sistema operativo)
if command -v xclip &> /dev/null; then
    echo -n "$PORTS" | xclip -selection clipboard
elif command -v pbcopy &> /dev/null; then
    echo -n "$PORTS" | pbcopy
else
    echo "No se encontró una herramienta para copiar al portapapeles. Instala xclip o pbcopy."
fi

# Eliminar el archivo temporal
rm "$TMP_FILE"
