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

# Config
RUN git clone https://github.com/ilidar/nvim-config /opt/nvim-config && \
    /opt/nvim-config/scripts/install.bash

# clangd
RUN apt-get update && apt-get install -y \
    clangd-12 && \
    rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100

# Node
RUN apt-get update && apt-get install -y \
    curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash -

RUN apt-get update && apt-get install -y \
    nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN npm update -g npm

# Lua
RUN apt-get update && apt-get install -y \
    ninja-build  && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/sumneko/lua-language-server $HOME/.deps/lua-language-server
RUN cd $HOME/.deps/lua-language-server && \
    git submodule update --init --recursive && \
    cd 3rd/luamake && \
    ./compile/install.sh && \
    cd ../.. && \
    ./3rd/luamake/luamake rebuild

# Python, bash, dockerfile, yaml
RUN npm install -g \
    pyright \
    yaml-language-server \
    dockerfile-language-server-nodejs \
    bash-language-server

# CMake
RUN pip install cmake-language-server

# Telescope dependency
RUN apt-get update && apt-get install -y \
    ripgrep && \
    rm -rf /var/lib/apt/lists/*

# Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add .cargo/bin to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# Stylua
RUN cargo install stylua
