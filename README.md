# Organización del Computador 1 - Comisión 7

Repositorio para el material de clases de la materia Organización del Computador 1 de la Universidad Nacional de General Sarmiento, Comisión 7.

## Descripción

Este repositorio contiene diapositivas y material didáctico organizado por semanas para facilitar el seguimiento del curso. El contenido se genera utilizando [Marp](https://marp.app/), una herramienta que permite crear presentaciones a partir de archivos Markdown.

## Estructura del repositorio

- `Semana1/`, `Semana2/`, etc.: Carpetas con el contenido de cada semana
- `themes/`: Temas personalizados para las diapositivas
- `templates/`: Plantillas para crear nuevas diapositivas
- `scripts/`: Scripts de utilidad para el manejo del repositorio
- `website/`: Archivos para el sitio web generado

## Desarrollo local

Este proyecto utiliza Docker para facilitar el desarrollo local. Para trabajar con las diapositivas:

1. Asegúrate de tener Docker y Docker Compose instalados
2. Ejecuta `docker-compose up` para iniciar el entorno de desarrollo
3. Edita los archivos Markdown en la carpeta correspondiente
4. Las diapositivas se actualizarán automáticamente en el navegador

## Generación de PDFs y sitio web

Cada vez que se realiza un commit a la rama main, una GitHub Action genera automáticamente:

- Archivos PDF de todas las diapositivas
- Un sitio web con todas las diapositivas organizadas cronológicamente

## Licencia

Este proyecto está licenciado bajo GNU General Public License v3.0 - ver el archivo [LICENSE](LICENSE) para más detalles.