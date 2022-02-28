local api = vim.api

local M = {}

-- Key mapping
function M.map(mode, key, result, opts)
    local options = { noremap = true, silent = true, expr = false }

    if opts then
        options = vim.tbl_extend("keep", opts, options)
    end

    api.nvim_set_keymap(mode, key, result, options)
end

-- Docker LSP
function M.get_running_containers_list()
    return vim.fn.systemlist('docker ps -f status=running --format "{{.Names}}"')
end

function M.select_container_from_list(containers)
    local options = {}
    for key, value in pairs(containers) do
        table.insert(options, key .. ". " .. value)
    end
    local container_index = vim.fn.inputlist(options)
    return containers[container_index]
end

function M.get_clangd_docker_cmd(container_name)
    return {
        "docker",
        "exec",
        "-i",
        container_name,
        "clangd-12",
        "--compile-commands-dir",
        "/opt/ws/build",
    }
end

function M.get_clangd_cmd_default()
    return { "clangd" }
end

function M.get_cmd()
    local containers = M.get_running_containers_list()
    if not containers or next(containers) == nil then
        return M.get_clangd_cmd_default()
    end
    local container_name = M.select_container_from_list(containers)
    if not container_name then
        return M.get_clangd_cmd_default()
    end
    return M.get_clangd_docker_cmd(container_name)
end

function M.restart_lsp()
    local base = require("plugins.lsp-configs.base")

    require("lspconfig").clangd.setup({
        on_attach = base.lsp_on_attach,
        capabilities = base.capabilities,
        cmd = M.get_cmd(),
    })
end

return M
