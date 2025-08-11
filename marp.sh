#!/bin/bash

# Script para facilitar el uso de Docker Compose con Marp
# Organización del Computador 1 - Comisión 7 (UNGS)

# Colores para mensajes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Función para mostrar ayuda
show_help() {
    echo -e "${BLUE}Uso:${NC} ./marp.sh [comando]"
    echo ""
    echo "Comandos disponibles:"
    echo -e "  ${GREEN}start${NC}     Inicia el servidor de desarrollo de Marp"
    echo -e "  ${GREEN}stop${NC}      Detiene el servidor de desarrollo"
    echo -e "  ${GREEN}pdf${NC}       Genera archivos PDF de todas las diapositivas"
    echo -e "  ${GREEN}html${NC}      Genera archivos HTML de todas las diapositivas"
    echo -e "  ${GREEN}website${NC}   Genera el sitio web completo"
    echo -e "  ${GREEN}clean${NC}     Elimina los archivos generados"
    echo -e "  ${GREEN}dev${NC}       Abre el proyecto en VS Code con devcontainer"
    echo -e "  ${GREEN}help${NC}      Muestra esta ayuda"
    echo ""
}

# Verificar si Docker está instalado
if ! command -v docker &> /dev/null; then
    echo -e "${RED}Error: Docker no está instalado.${NC}"
    echo "Por favor, instala Docker antes de continuar."
    exit 1
fi

# Verificar si Docker Compose está instalado
if ! command -v docker-compose &> /dev/null; then
    echo -e "${RED}Error: Docker Compose no está instalado.${NC}"
    echo "Por favor, instala Docker Compose antes de continuar."
    exit 1
fi

# Directorio del script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Verificar si se proporcionó un comando
if [ $# -eq 0 ]; then
    show_help
    exit 0
fi

# Procesar el comando
case "$1" in
    start)
        echo -e "${BLUE}Iniciando servidor de desarrollo de Marp...${NC}"
        docker-compose -f "$DIR/docker/docker-compose.yml" up -d marp
        echo -e "${GREEN}Servidor iniciado en http://localhost:8080${NC}"
        ;;
    stop)
        echo -e "${BLUE}Deteniendo servidor de desarrollo...${NC}"
        docker-compose -f "$DIR/docker/docker-compose.yml" down
        echo -e "${GREEN}Servidor detenido${NC}"
        ;;
    pdf)
        echo -e "${BLUE}Generando archivos PDF...${NC}"
        docker-compose -f "$DIR/docker/docker-compose.yml" --profile pdf up pdf-generator
        echo -e "${GREEN}PDFs generados en la carpeta dist/pdf/${NC}"
        ;;
    html)
        echo -e "${BLUE}Generando archivos HTML...${NC}"
        docker-compose -f "$DIR/docker/docker-compose.yml" --profile html up html-generator
        echo -e "${GREEN}HTMLs generados en la carpeta dist/html/${NC}"
        ;;
    website)
        echo -e "${BLUE}Generando sitio web completo...${NC}"
        docker-compose -f "$DIR/docker/docker-compose.yml" --profile website up website-generator
        echo -e "${GREEN}Sitio web generado en la carpeta dist/website/${NC}"
        ;;
    dev)
        echo -e "${BLUE}Abriendo proyecto en VS Code con devcontainer...${NC}"
        if command -v code &> /dev/null; then
            code --folder-uri vscode-remote://dev-container+${PWD}
            echo -e "${GREEN}VS Code abierto con devcontainer${NC}"
        else
            echo -e "${RED}Error: VS Code no está instalado o no está en el PATH.${NC}"
            echo "Por favor, instala VS Code y asegúrate de que el comando 'code' esté disponible."
            exit 1
        fi
        ;;
    clean)
        echo -e "${BLUE}Limpiando archivos generados...${NC}"
        rm -rf "$DIR/dist"
        echo -e "${GREEN}Archivos eliminados${NC}"
        ;;
    help)
        show_help
        ;;
    *)
        echo -e "${RED}Error: Comando desconocido '$1'${NC}"
        show_help
        exit 1
        ;;
esac
