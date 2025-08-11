FROM node:18-slim

LABEL maintainer="Docente Organización del Computador 1 - Comisión 7"
LABEL description="Entorno de desarrollo para Marp con soporte de LaTeX"

# Evitar interacciones durante la instalación de paquetes
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-latex-extra \
    texlive-xetex \
    texlive-lang-spanish \
    fonts-lmodern \
    fonts-texgyre \
    fonts-liberation \
    fontconfig \
    chromium \
    ca-certificates \
    git \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configurar Chromium para que funcione en un contenedor
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Crear directorio de trabajo
WORKDIR /app

# Copiar package.json y package-lock.json (si existen)
COPY package*.json ./

# Instalar Marp CLI y dependencias
RUN npm install -g @marp-team/marp-cli \
    && npm install

# Crear un usuario no-root para ejecutar la aplicación
RUN groupadd -r marpuser && useradd -r -g marpuser -m marpuser \
    && chown -R marpuser:marpuser /app

# Cambiar al usuario no-root
USER marpuser

# Exponer el puerto para el servidor de desarrollo
EXPOSE 8080

# Comando por defecto
CMD ["marp", "--server", "--watch", "."]