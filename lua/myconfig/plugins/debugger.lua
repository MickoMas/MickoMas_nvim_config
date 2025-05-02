return
{
    'mfussenegger/nvim-dap',
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        {
            'williamboman/mason.nvim',
            opts =
            {
                ensure_installed =
                {
                    "cpptools",
                }
            }
        },
        'nvim-neotest/nvim-nio',
    },
    config = function()
        local dap           = require "dap"
        local ui            = require "dapui"
        local virutal_text  = require "nvim-dap-virtual-text"

        ui.setup()
        virutal_text.setup()


        local cpp_debugger = vim.fn.exepath("OpenDebugAD7")

        if cpp_debugger ~= "" then
            dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
                command = cpp_debugger,
            }

            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopAtEntry = true,
                },
                {
                    name = 'Attach to gdbserver :1234',
                    type = 'cppdbg',
                    request = 'launch',
                    MIMode = 'gdb',
                    miDebuggerServerAddress = 'localhost:1234',
                    miDebuggerPath = '/usr/bin/gdb',
                    cwd = '${workspaceFolder}',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                },
            }
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>dC", dap.run_to_cursor)
            vim.keymap.set("n", "<F1>"      , dap.continue)
            vim.keymap.set("n", "<F2>"      , dap.step_into)
            vim.keymap.set("n", "<F3>"      , dap.step_over)
            vim.keymap.set("n", "<F4>"      , dap.step_out)
            vim.keymap.set("n", "<F5>"      , dap.step_back)
            vim.keymap.set("n", "<F12>"     , dap.restart)

            vim.keymap.set("n", "<leader>d?", function()
               ui.eval(nil, { enter = true })
            end)

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end

            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end

            dap.listeners.after.event_terminated.dapui_config = function()
                ui.close()
            end

            dap.listeners.after.event_exited.dapui_config = function()
                ui.close()
            end

            vim.keymap.set("n", "<leader>du", ui.close)




        end

    end
}
