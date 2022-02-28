local base = require("plugins.lsp-configs.base")

require("lspconfig").bashls.setup({
    on_attach = base.lsp_on_attach,
    capabilities = base.capabilities,
})
