local base = require("plugins.lsp-configs.base")

require("lspconfig").pyright.setup({
    on_attach = base.lsp_on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = base.capabilities,
})
