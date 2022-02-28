vim.cmd([[packadd packer.nvim]])

return require("packer").startup({
    function(use)
        use({ "wbthomason/packer.nvim" })
        use({
            "kosayoda/nvim-lightbulb",
            config = function()
                require("plugins.nvim-lightbulb")
            end,
        })
        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("plugins.treesitter")
            end,
        })
        use({
            "neovim/nvim-lspconfig",
            config = function()
                require("plugins.nvim-lspconfig")
            end,
        })

        --[[ use({
			"hrsh7th/nvim-compe",
			config = function()
				require("plugins.nvim-compe")
			end,
		}) ]]

        use({ "hrsh7th/vim-vsnip" })
        use({ "hrsh7th/vim-vsnip-integ" })
        use({ "hrsh7th/cmp-nvim-lsp" })
        use({ "hrsh7th/cmp-buffer" })
        use({ "hrsh7th/cmp-path" })
        use({ "hrsh7th/cmp-cmdline" })
        use({ "hrsh7th/cmp-vsnip" })

        use({
            "hrsh7th/nvim-cmp",
            requires = {
                { "hrsh7th/cmp-nvim-lsp", opt = true },
                { "hrsh7th/cmp-buffer", opt = true },
                { "hrsh7th/cmp-path", opt = true },
                { "hrsh7th/cmp-cmdline", opt = true },
                { "hrsh7th/cmp-vsnip", opt = true },
                { "hrsh7th/vim-vsnip", opt = true },
            },
            config = function()
                require("plugins.nvim-cmp")
            end,
        })

        use({
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup()
            end,
        })

        use({
            "nvim-telescope/telescope.nvim",
            requires = { { "nvim-lua/plenary.nvim" } },
        })

        use({ "npxbr/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })

        use({
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("trouble").setup({
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                })
            end,
        })

        use({
            "lewis6991/gitsigns.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
            },
            config = function()
                require("plugins.gitsigns")
            end,
        })

        use({
            "hoob3rt/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
            config = function()
                require("plugins.lualine")
            end,
        })

        use({
            "sbdchd/neoformat",
            config = function()
                require("plugins.neoformat")
            end,
        })

        use({
            "mfussenegger/nvim-dap",
            config = function()
                require("plugins.nvim-dap")
            end,
        })

        use({
            "rcarriga/nvim-dap-ui",
            requires = { "mfussenegger/nvim-dap" },
            config = function()
                require("plugins.nvim-dap-ui")
            end,
        })

        use({ "b3nj5m1n/kommentary" })

        use({
            "ray-x/lsp_signature.nvim",
            config = function()
                require("lsp_signature").setup()
            end,
        })

        use({ "tversteeg/registers.nvim" })

        use({
            "romgrk/barbar.nvim",
            requires = { "kyazdani42/nvim-web-devicons" },
        })

        use({
            "onsails/lspkind-nvim",
            config = function()
                require("plugins.lspkind")
            end,
        })

        use({ "rafamadriz/friendly-snippets" })

        use({ "sakhnik/nvim-gdb", run = ":!./install.sh" })

        use({
            "kyazdani42/nvim-tree.lua",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("plugins.nvim-tree")
            end,
        })

        use({
            "alexghergh/nvim-tmux-navigation",
            config = function()
                require("plugins.nvim-tmux-navigation")
            end,
        })

        use({ "ilidar/git-tree.nvim" })

        use({ "chr4/nginx.vim" })
    end,
    config = {
        display = {
            open_fn = require("packer.util").float,
        },
    },
})
