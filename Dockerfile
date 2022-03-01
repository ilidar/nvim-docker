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

RUN git clone https://github.com/neovim/nvim-lspconfig \
    /root/.local/share/nvim/site/pack/plugins/start/nvim-lspconfig

RUN git clone https://github.com/kosayoda/nvim-lightbulb \
    /root/.local/share/nvim/site/pack/plugins/start/nvim-lightbulb

RUN git clone https://github.com/hrsh7th/cmp-nvim-lsp \
    /root/.local/share/nvim/site/pack/plugins/start/cmp-nvim-lsp

RUN git clone https://github.com/hrsh7th/cmp-buffer \
    /root/.local/share/nvim/site/pack/plugins/start/cmp-buffer

RUN git clone https://github.com/hrsh7th/cmp-path \
    /root/.local/share/nvim/site/pack/plugins/start/cmp-path

RUN git clone https://github.com/hrsh7th/cmp-cmdline \
    /root/.local/share/nvim/site/pack/plugins/start/cmp-cmdline

RUN git clone https://github.com/hrsh7th/nvim-cmp \
    /root/.local/share/nvim/site/pack/plugins/start/nvim-cmp

RUN git clone https://github.com/hrsh7th/cmp-vsnip \
    /root/.local/share/nvim/site/pack/plugins/start/cmp-vsnip

RUN git clone https://github.com/hrsh7th/vim-vsnip \
    /root/.local/share/nvim/site/pack/plugins/start/vim-vsnip

RUN git clone https://github.com/windwp/nvim-autopairs \
    /root/.local/share/nvim/site/pack/plugins/start/nvim-autopairs

RUN git clone https://github.com/nvim-lua/plenary.nvim \
    /root/.local/share/nvim/site/pack/plugins/start/plenary.nvim

RUN git clone https://github.com/nvim-telescope/telescope.nvim \
    /root/.local/share/nvim/site/pack/plugins/start/telescope.nvim

RUN git clone https://github.com/rktjmp/lush.nvim \
    /root/.local/share/nvim/site/pack/plugins/start/lush.nvim

RUN git clone https://github.com/npxbr/gruvbox.nvim \
    /root/.local/share/nvim/site/pack/plugins/start/gruvbox.nvim

RUN git clone https://github.com/folke/trouble.nvim \
    /root/.local/share/nvim/site/pack/plugins/start/trouble.nvim

RUN git clone https://github.com/lewis6991/gitsigns.nvim \
    /root/.local/share/nvim/site/pack/plugins/start/gitsigns.nvim

RUN git clone https://github.com/hoob3rt/lualine.nvim \
    /root/.local/share/nvim/site/pack/plugins/start/lualine.nvim

RUN git clone https://github.com/sbdchd/neoformat \
    /root/.local/share/nvim/site/pack/plugins/start/neoformat

RUN git clone https://github.com/mfussenegger/nvim-dap \
    /root/.local/share/nvim/site/pack/plugins/start/nvim-dap

RUN git clone https://github.com/rcarriga/nvim-dap-ui \
    /root/.local/share/nvim/site/pack/plugins/start/nvim-dap-ui

RUN git clone https://github.com/b3nj5m1n/kommentary \
    /root/.local/share/nvim/site/pack/plugins/start/kommentary

RUN git clone https://github.com/ray-x/lsp_signature.nvim \
    /root/.local/share/nvim/site/pack/plugins/start/lsp_signature.nvim

RUN git clone https://github.com/tversteeg/registers.nvim \
    /root/.local/share/nvim/site/pack/plugins/start/registers.nvim

RUN git clone https://github.com/romgrk/barbar.nvim \
    /root/.local/share/nvim/site/pack/plugins/start/barbar.nvim

RUN git clone https://github.com/onsails/lspkind-nvim \
    /root/.local/share/nvim/site/pack/plugins/start/lspkind-nvim

RUN git clone https://github.com/rafamadriz/friendly-snippets \
    /root/.local/share/nvim/site/pack/plugins/start/friendly-snippets

RUN git clone https://github.com/sakhnik/nvim-gdb \
    /root/.local/share/nvim/site/pack/plugins/start/nvim-gdb

RUN git clone https://github.com/alexghergh/nvim-tmux-navigation \
    /root/.local/share/nvim/site/pack/plugins/start/nvim-tmux-navigation

RUN git clone https://github.com/ilidar/git-tree.nvim \
    /root/.local/share/nvim/site/pack/plugins/start/git-tree.nvim

RUN git clone https://github.com/chr4/nginx.vim \
    /root/.local/share/nvim/site/pack/plugins/start/nginx.vim

RUN apt-get update && apt-get install -y \
    clangd-12 && \
    rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100

COPY nvim /root/.config/nvim
