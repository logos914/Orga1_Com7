#!/bin/bash

# Script para crear una nueva semana de diapositivas
# Organización del Computador 1 - Comisión 7 (UNGS)

# Colores para mensajes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Directorio del script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
TEMPLATES_DIR="$REPO_DIR/templates"

# Función para mostrar ayuda
show_help() {
    echo -e "${BLUE}Uso:${NC} ./create-new-week.sh [número de semana] [opciones]"
    echo ""
    echo "Opciones:"
    echo -e "  ${GREEN}-h, --help${NC}              Muestra esta ayuda"
    echo -e "  ${GREEN}-t, --theme${NC} THEME       Especifica el tema a usar (institutional o matrix)"
    echo -e "  ${GREEN}-c, --copy${NC} WEEK         Copia la estructura de otra semana (ej: Semana1)"
    echo -e "  ${GREEN}-n, --topics${NC} NUMBER     Número de temas a crear (por defecto: 2)"
    echo ""
    echo "Ejemplos:"
    echo -e "  ${YELLOW}./create-new-week.sh 3${NC}                  Crea la Semana3 con el tema por defecto"
    echo -e "  ${YELLOW}./create-new-week.sh 4 -t matrix${NC}        Crea la Semana4 con el tema matrix"
    echo -e "  ${YELLOW}./create-new-week.sh 5 -c Semana2${NC}       Crea la Semana5 copiando la estructura de Semana2"
    echo -e "  ${YELLOW}./create-new-week.sh 6 -n 3${NC}             Crea la Semana6 con 3 temas"
    echo ""
}

# Función para crear un archivo de tema
create_topic_file() {
    local week_dir=$1
    local topic_number=$2
    local theme=$3
    local topic_file="$week_dir/tema$topic_number.md"
    
    echo -e "${BLUE}Creando archivo de tema $topic_number...${NC}"
    
    # Crear el archivo de tema basado en la plantilla base
    cat > "$topic_file" << EOL
---
marp: true
theme: $theme
paginate: true
header: "Organización del Computador 1 - Comisión 7"
footer: "UNGS - 2025"
---

<!-- _class: lead -->
# Tema $topic_number - Semana ${week_dir##*/}
## Organización del Computador 1
### Comisión 7 - UNGS

---

# Contenido

1. Punto 1
2. Punto 2
3. Punto 3

---

# Sección 1

Contenido de la sección 1

---

# Sección 2

Contenido de la sección 2

---

<!-- _class: lead -->
# ¿Preguntas?

EOL

    echo -e "${GREEN}Archivo de tema $topic_number creado: $topic_file${NC}"
}

# Verificar argumentos
if [ $# -eq 0 ]; then
    echo -e "${RED}Error: Debe especificar un número de semana.${NC}"
    show_help
    exit 1
fi

# Valores por defecto
WEEK_NUMBER=$1
THEME="institutional"
COPY_WEEK=""
NUM_TOPICS=2

# Procesar opciones
shift
while [ $# -gt 0 ]; do
    case "$1" in
        -h|--help)
            show_help
            exit 0
            ;;
        -t|--theme)
            THEME="$2"
            if [ "$THEME" != "institutional" ] && [ "$THEME" != "matrix" ]; then
                echo -e "${RED}Error: Tema no válido. Use 'institutional' o 'matrix'.${NC}"
                exit 1
            fi
            shift 2
            ;;
        -c|--copy)
            COPY_WEEK="$2"
            if [ ! -d "$REPO_DIR/$COPY_WEEK" ]; then
                echo -e "${RED}Error: La semana a copiar '$COPY_WEEK' no existe.${NC}"
                exit 1
            fi
            shift 2
            ;;
        -n|--topics)
            NUM_TOPICS="$2"
            if ! [[ "$NUM_TOPICS" =~ ^[0-9]+$ ]]; then
                echo -e "${RED}Error: El número de temas debe ser un número entero.${NC}"
                exit 1
            fi
            shift 2
            ;;
        *)
            echo -e "${RED}Error: Opción desconocida: $1${NC}"
            show_help
            exit 1
            ;;
    esac
done

# Crear el directorio de la semana
WEEK_DIR="$REPO_DIR/Semana$WEEK_NUMBER"

if [ -d "$WEEK_DIR" ]; then
    echo -e "${YELLOW}Advertencia: El directorio Semana$WEEK_NUMBER ya existe.${NC}"
    read -p "¿Desea sobrescribirlo? (s/n): " OVERWRITE
    if [ "$OVERWRITE" != "s" ] && [ "$OVERWRITE" != "S" ]; then
        echo -e "${BLUE}Operación cancelada.${NC}"
        exit 0
    fi
    rm -rf "$WEEK_DIR"
fi

echo -e "${BLUE}Creando directorio para Semana$WEEK_NUMBER...${NC}"
mkdir -p "$WEEK_DIR/assets/images"

# Crear README.md para la semana
echo -e "${BLUE}Creando README.md para la semana...${NC}"
cat > "$WEEK_DIR/README.md" << EOL
# Semana $WEEK_NUMBER

Esta carpeta contiene el material correspondiente a la semana $WEEK_NUMBER de clases de Organización del Computador 1.

## Contenido

EOL

# Agregar lista de temas al README
for ((i=1; i<=NUM_TOPICS; i++)); do
    echo "- \`tema$i.md\`: Título del tema $i" >> "$WEEK_DIR/README.md"
done

cat >> "$WEEK_DIR/README.md" << EOL

## Recursos

Los recursos adicionales como imágenes, diagramas o código de ejemplo se encuentran en la carpeta \`assets/\`.
EOL

echo -e "${GREEN}README.md creado: $WEEK_DIR/README.md${NC}"

# Crear archivos de temas
if [ -n "$COPY_WEEK" ]; then
    echo -e "${BLUE}Copiando estructura de $COPY_WEEK...${NC}"
    find "$REPO_DIR/$COPY_WEEK" -name "*.md" -not -name "README.md" -exec cp {} "$WEEK_DIR/" \;
    echo -e "${GREEN}Estructura copiada de $COPY_WEEK${NC}"
else
    for ((i=1; i<=NUM_TOPICS; i++)); do
        create_topic_file "$WEEK_DIR" $i "$THEME"
    done
fi

echo -e "${GREEN}¡Semana$WEEK_NUMBER creada exitosamente!${NC}"
echo -e "Directorio: ${YELLOW}$WEEK_DIR${NC}"
echo -e "Tema utilizado: ${YELLOW}$THEME${NC}"
echo -e "Número de temas: ${YELLOW}$NUM_TOPICS${NC}"

echo -e "\n${BLUE}Para comenzar a editar las diapositivas:${NC}"
echo -e "1. Navegue al directorio: ${YELLOW}cd $WEEK_DIR${NC}"
echo -e "2. Edite los archivos .md con su editor preferido"
echo -e "3. Para previsualizar las diapositivas, ejecute: ${YELLOW}../marp.sh start${NC}"

exit 0