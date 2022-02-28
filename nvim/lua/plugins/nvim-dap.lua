local dap = require("dap")
local HOME = os.getenv("HOME")

local M = setmetatable({}, {
    __index = function(tbl, key)
        if key == "widgets" then
            local val = require("dap.ui.widgets")
            rawset(tbl, key, val)
            return val
        end
        return dap[key]
    end,
})

local function setup_widgets()
    local widgets = require("dap.ui.widgets")
    M.sidebar = widgets.sidebar(widgets.scopes)
end

function M.setup()
    setup_widgets()

    dap.defaults.fallback.terminal_win_cmd = "tabnew"
    dap.defaults.fallback.external_terminal = {
        command = "/usr/bin/alacritty",
        args = { "-e" },
    }

    dap.adapters.codelldb = function(on_adapter)
        local stdout = vim.loop.new_pipe(false)
        local stderr = vim.loop.new_pipe(false)
        local cmd = HOME .. "/apps/codelldb/extension/adapter/codelldb"
        local handle, pid_or_err
        local opts = {
            stdio = { nil, stdout, stderr },
            detached = true,
        }
        handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
            stdout:close()
            stderr:close()
            handle:close()
            if code ~= 0 then
                print("codelldb exited with code", code)
            end
        end)
        assert(handle, "Error running codelldb: " .. tostring(pid_or_err))
        stdout:read_start(function(err, chunk)
            assert(not err, err)
            if chunk then
                local port = chunk:match("Listening on port (%d+)")
                if port then
                    vim.schedule(function()
                        on_adapter({
                            type = "server",
                            host = "127.0.0.1",
                            port = port,
                        })
                    end)
                else
                    vim.schedule(function()
                        require("dap.repl").append(chunk)
                    end)
                end
            end
        end)
        stderr:read_start(function(err, chunk)
            assert(not err, err)
            if chunk then
                vim.schedule(function()
                    require("dap.repl").append(chunk)
                end)
            end
        end)
    end
    dap.adapters.lldb = {
        type = "executable",
        command = "/usr/bin/lldb-vscode",
        name = "lldb",
    }
    dap.configurations.cpp = {
        {
            name = "Attach to gdbserver :1234",
            type = "cppdbg",
            request = "launch",
            MIMode = "gdb",
            miDebuggerServerAddress = "localhost:1234",
            miDebuggerPath = "/usr/bin/gdb",
            cwd = "${workspaceFolder}",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
        },
        {
            name = "Launch via cppdgb",
            type = "cppdbg",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            args = {},
        },
        {
            name = "Launch via codelldb",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            args = {},
        },
        {
            name = "Launch (lldb via integrated terminal)",
            type = "lldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
            runInTerminal = true,
        },
        {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
            runInTerminal = false,
        },
        {
            -- If you get an "Operation not permitted" error using this, try disabling YAMA:
            --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
            name = "Attach to process",
            type = "lldb",
            request = "attach",
            pid = require("dap.utils").pick_process,
            args = {},
        },
    }
    dap.configurations.c = dap.configurations.cpp
end

M.setup()

return M
