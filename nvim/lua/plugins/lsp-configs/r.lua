local base = require("plugins.lsp-configs.base")

require("lspconfig").r_language_server.setup({
    on_attach = base.lsp_on_attach,
    init_options = {
        compilationDatabaseDirectory = "build",
    },
})
