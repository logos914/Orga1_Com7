#################################
# Base image with arguments
# Get an ubuntu base, to avoid debian vulnerabilities in python image
FROM ubuntu:latest

# Configuration for gitpod compatibility
# See https://www.gitpod.io/docs/configure/workspaces/workspace-image#custom-base-image
ARG USER=gitpod
ARG UID=33333
ARG GID=33333

# Set locale
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Add user
RUN groupadd --gid ${GID} ${USER} \
    && useradd --home-dir /home/${USER} --create-home --uid ${UID} \
       --gid ${GID} --shell /bin/bash --skel /dev/null ${USER}

# Install tooling
RUN    apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        curl wget jq \
        git openssh-client \
        python3 python3-pip \
        libgbm1 libasound2t64 xvfb \
        zsh vim



# Install node
# See https://github.com/nodesource/distributions#debinstall
RUN    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Prepare for marp installation
# See https://github.com/marp-team/marp-cli
ENV CHROME_PATH /usr/bin/chromium-browser
ENV NPM_CONFIG_PREFIX /home/${USER}/.npm-global
ENV PATH="${PATH}:/home/${USER}/.local/bin:/home/${USER}/.npm-global/bin"

# Set user
USER ${USER}

# Configure zsh
RUN    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended \
    && sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' /home/${USER}/.zshrc

# Install yarn for faster marp installation
RUN npm install --global yarn
# Pre-install marp-cli
RUN yarn global add @marp-team/marp-cli
