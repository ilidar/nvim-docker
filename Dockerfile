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

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

COPY nvim /root/.config/nvim

# RUN nvim --headless \
#     -c 'autocmd User PackerComplete quitall' \
#     -c 'PackerSync' \
#     -c 'qall'

# RUN nvim --headless +PackerSync +qa

# RUN nvim --headless +'autocmd User PackerComplete sleep 100m | qall' +PackerSync

# RUN nvim --headless \
#   -c "autocmd User PackerCompileDone sleep 100m | quitall" \
#   -c "PackerSync"

RUN echo "00004"

RUN nvim --headless \
  -c "autocmd User PackerCompileDone quitall" \
  -c "PackerSync"

# RUN nvim --headless ' +TSInstall -sync all'
RUN nvim --headless \
    ' +TSInstall -sync all' +qa
