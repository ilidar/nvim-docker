local base = require("plugins.lsp-configs.base")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").html.setup({
    cmd = { "vscode-html-language-server", "--stdio" },
    on_attach = base.lsp_on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    filetypes = { "html", "htmldjango" },
    capabilities = capabilities,
})

require("lspconfig").tsserver.setup({
    on_attach = base.lsp_on_attach,
    capabilities = base.capabilities,
})

require("lspconfig").cssls.setup({
    on_attach = base.lsp_on_attach,
    capabilities = base.capabilities,
})
