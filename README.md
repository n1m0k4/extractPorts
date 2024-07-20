# extractPorts.sh

`extractPorts.sh` es un script en Bash que extrae puertos abiertos de un archivo de salida de escaneo `nmap` en formato NMAP basado en el funcionamiento del script de S4vitar. El script formatea los resultados, los guarda en un archivo temporal, y copia los puertos al portapapeles para facilitar su uso.

## Características

- **Extrae la IP y los puertos**: Obtiene la IP del escaneo y los puertos abiertos del archivo de salida de `nmap`.
- **Formato de salida**: Crea un archivo temporal con la IP y los puertos en un formato legible y estéticamente agradable.
- **Copia al portapapeles**: Copia los puertos al portapapeles para su uso inmediato.
- **Eliminación del archivo temporal**: Elimina el archivo temporal después de su uso.

## Requisitos

- **nmap**: Debe estar instalado para generar el archivo de salida.
- **xclip** o **pbcopy**: Necesario para copiar al portapapeles (dependiendo del sistema operativo).

## Instalación

1. **Descargar el script**:
    ```bash
    wget https://github.com/n1m0k4/extractPorts/raw/main/extractPorts.sh
    ```

2. **Dar permisos de ejecución**:
    ```bash
    chmod +x extractPorts.sh
    ```

3. **(Opcional) Añadir el script a `/usr/local/bin`**:
    Para ejecutar el script desde cualquier ubicación, puedes copiarlo a `/usr/local/bin`:
    ```bash
    sudo cp extractPorts.sh /usr/local/bin/extractPorts
    ```
    Esto te permitirá ejecutar el script simplemente escribiendo `extractPorts` desde cualquier directorio.

## Uso

1. **Genera un archivo de salida de nmap**:
    Ejecuta un escaneo de `nmap` y guarda la salida en un archivo:
    ```bash
    nmap -sT -oN allPorts.txt <direccion_ip>
    ```

2. **Ejecuta el script**:
    Pasa el archivo de salida de `nmap` como argumento al script:
    ```bash
    extractPorts allPorts.txt
    ```

    Esto creará un archivo temporal llamado `extractPorts.tmp` con la IP y los puertos, y copiará los puertos al portapapeles.

## Ejemplo de salida

El archivo `extractPorts.tmp` tendrá el siguiente formato:
```bash
[*] Host: 192.168.1.1

[*] Puertos abiertos: 22,80,443


[!] Puertos copiados a la clipboard con éxito [!] 
```

## Dependencias

- **xclip**: Para sistemas basados en Linux, puedes instalarlo con:
    ```bash
    sudo apt-get install xclip
    ```

- **pbcopy**: Para macOS, `pbcopy` debería estar instalado por defecto. No requiere instalación adicional.

## Contribuciones

¡Las contribuciones son bienvenidas! Si tienes sugerencias o mejoras para el script, por favor abre un *issue* o envía un *pull request*.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.
