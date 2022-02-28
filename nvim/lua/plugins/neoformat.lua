local g = vim.g

g.neoformat_python_autopep8 = {
    exe = "yapf",
    args = { "--style google" },
}
