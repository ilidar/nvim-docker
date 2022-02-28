local U = require("utils")

------------------------------------------------------------
-- Move between windows
------------------------------------------------------------
U.map("n", "<C-j>", "<C-W>j")
U.map("n", "<C-k>", "<C-W>k")
U.map("n", "<C-h>", "<C-W>h")
U.map("n", "<C-l>", "<C-W>l")

------------------------------------------------------------
-- Disable highlight when <leader><CR> is pressed
------------------------------------------------------------
U.map("n", "<leader><CR>", ":noh<CR>")

------------------------------------------------------------
-- Search
------------------------------------------------------------
U.map("n", "<space>", "/")
U.map("n", "<C-space>", "?")

------------------------------------------------------------
-- Tabs
------------------------------------------------------------
U.map("n", "<leader>tn", ":tabnew<CR>")
U.map("n", "<leader>to", ":tabonly<CR>")
U.map("n", "<leader>tc", ":tabclose<CR>")
U.map("n", "<leader>tm", ":tabmove<CR>")
U.map("n", "<leader>tl", ":tabnext<CR>")

------------------------------------------------------------
-- Telescope
------------------------------------------------------------
U.map("n", "<C-N>", "<cmd>lua require('telescope.builtin').find_files()<CR>")
U.map("n", "<C-G>", "<cmd>lua require('telescope.builtin').live_grep()<CR>")

------------------------------------------------------------
-- nvim-tree
------------------------------------------------------------
U.map("n", "<leader>nn", "<cmd>NvimTreeToggle<CR>")

------------------------------------------------------------
-- Trouble
------------------------------------------------------------
U.map("n", "<leader>xx", "<cmd>TroubleToggle<CR>")

------------------------------------------------------------
-- Neoformat
------------------------------------------------------------
U.map("n", "<leader>cf", "<cmd>Neoformat<CR>")

------------------------------------------------------------
-- nvim-dap-ui
------------------------------------------------------------
U.map("n", "<F5>", "<cmd>lua require('plugins.nvim-dap').continue()<CR>")
U.map("n", "<F10>", "<cmd>lua require('plugins.nvim-dap').step_over()<CR>")
U.map("n", "<F11>", "<cmd>lua require('plugins.nvim-dap').step_into()<CR>")
U.map("n", "<F12>", "<cmd>lua require('plugins.nvim-dap').step_out()<CR>")
U.map("n", "<F7>", "<cmd>lua require('plugins.nvim-dap').toggle_breakpoint()<CR>")
U.map(
	"n",
	"<F8>",
	"<cmd>lua require('plugins.nvim-dap').toggle_breakpoint(vim.fn.input('Breakpoint Condition: '), nil, nil, true)<CR>"
)
U.map("n", "<leader>dv", '<cmd>lua require("plugins.nvim-dap").widgets.hover()<CR>')
U.map("n", "<leader>df", '<cmd>lua local w = require("plugins.nvim-dap").widgets; w.centered_float(w.frames)<CR>')
U.map("n", "<leader>ds", '<cmd>lua local w = require("plugins.nvim-dap").widgets; w.centered_float(w.scopes)<CR>')
U.map("n", "<leader>dS", '<cmd>lua require("plugins.nvim-dap").sidebar.toggle()<CR>')
U.map("n", "<leader>dr", '<cmd>lua require("plugins.nvim-dap").repl.toggle({height=15})<CR>')
U.map("n", "<leader>dg", '<cmd>lua require("plugins.nvim-dap").run_to_cursor()<CR>')
U.map("n", "<leader>dc", '<cmd>lua require("dap").disconnect({ terminateDebuggee = true });require"dap".close()<CR>')
U.map("n", "<leader>du", '<cmd>lua require("dapui").toggle()<CR>')

------------------------------------------------------------
-- kommentary
------------------------------------------------------------
vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<leader>cc", "<Plug>kommentary_visual_default", {})

------------------------------------------------------------
-- barbar.nvim
------------------------------------------------------------
U.map("n", "<A-c>", ":BufferClose<CR>")
U.map("n", "<A-,>", ":BufferPrevious<CR>")
U.map("n", "<A-.>", ":BufferNext<CR>")
U.map("n", "<A-<>", ":BufferMovePrevious<CR>")
U.map("n", "<A->>", ":BufferMoveNext<CR>")
U.map("n", "<A-1>", ":BufferGoto 1<CR>")
U.map("n", "<A-2>", ":BufferGoto 2<CR>")
U.map("n", "<A-3>", ":BufferGoto 3<CR>")
U.map("n", "<A-4>", ":BufferGoto 4<CR>")
U.map("n", "<A-5>", ":BufferGoto 5<CR>")
U.map("n", "<A-6>", ":BufferGoto 6<CR>")
U.map("n", "<A-7>", ":BufferGoto 7<CR>")
U.map("n", "<A-8>", ":BufferGoto 8<CR>")
U.map("n", "<A-9>", ":BufferGoto 9<CR>")

------------------------------------------------------------
-- GitTree
------------------------------------------------------------
U.map("n", "<leader>gg", ":GitTreeToggle<CR>")

------------------------------------------------------------
-- Docker & LSP
------------------------------------------------------------
U.map("n", "<F2>", '<cmd>lua require("utils").restart_lsp()<CR>')
