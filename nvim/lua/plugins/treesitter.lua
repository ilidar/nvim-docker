require("nvim-treesitter.configs").setup({
    -- nvim-treesitter/nvim-treesitter (self config)
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<leader>si",
            node_incremental = "<leader>sn",
            node_decremental = "<leader>sN",
            scope_incremental = "<leader>sc",
        },
    },
})
