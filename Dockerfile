FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    software-properties-common && \
    rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:neovim-ppa/stable && \
    apt-get update && \
    apt-get install -y neovim && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    python3-dev \
    python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    git && \
    rm -rf /var/lib/apt/lists/*

# Plugins
RUN git clone --recurse-submodules https://github.com/ilidar/nvim-plugins /opt/nvim-plugins && \
    /opt/nvim-plugins/scripts/install.bash

# nvim-treesitter init
RUN nvim --headless -c 'TSInstallSync all' -c 'qall'

# Config
RUN git clone https://github.com/ilidar/nvim-config /opt/nvim-config && \
    /opt/nvim-config/scripts/install.bash

# Language servers
RUN apt-get update && apt-get install -y \
    clangd-12 && \
    rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100
