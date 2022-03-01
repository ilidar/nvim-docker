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

RUN mkdir -p /root/.local/share/nvim/site/pack/plugins/opt && \
    mkdir -p /root/.local/share/nvim/site/pack/plugins/start

RUN git clone https://github.com/nvim-treesitter/nvim-treesitter \
    /root/.local/share/nvim/site/pack/plugins/start/nvim-treesitter

# RUN nvim --headless ' +TSInstallSync all' +qa
RUN nvim --headless -c 'TSInstallSync all' -c 'qall'

RUN git clone https://github.com/kyazdani42/nvim-web-devicons  \
    /root/.local/share/nvim/site/pack/plugins/start/nvim-web-devicons

RUN git clone https://github.com/kyazdani42/nvim-tree.lua \
    /root/.local/share/nvim/site/pack/plugins/start/nvim-tree.lua

COPY nvim /root/.config/nvim

