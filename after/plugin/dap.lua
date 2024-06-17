local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    print("DAP could not be loaded")
    return
end

-- general keybinds
 
vim.keymap.set("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input("condition: ")) end);
vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end);
vim.keymap.set("n", "<leader>dc", function() dap.continue() end);
vim.keymap.set("n", "<leader>dn", function() dap.step_over() end); vim.keymap.set("n", "<leader>di", function() dap.step_into() end);
vim.keymap.set("n", "<leader>do", function()  dap.step_out() end);
vim.keymap.set("n", "<leader>dt", function()  dap.terminate() end);

-- cpp and c configuration
dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode",
    name = "lldb",
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = function()
            return {vim.fn.input('Arguments: ')}
        end,
    }
}

-- ui configuration

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
    print("DAP UI could not be loaded")
    return
end

dapui.setup({
    controls = {
      element = "repl",
      enabled = true,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = ""
      }
    },
    layouts = {
        {
            elements = { 
                { id = "scopes", size = 0.25 }, 
                { id = "stacks", size = 0.25 }, 
                { id = "watches", size = 0.5 } 
            },
            position = "left",
            size = 40
        }, 
        {
            elements = { 
                { id = "repl", size = 1.0 }, 
            },
            position = "bottom",
            size = 10
        }
    },
});

-- open or close api on dap events
dap.listeners.after.event_initialized['dapui'] = function()
    dapui.open();
end
dap.listeners.after.event_terminated['dapui'] = function()
    dapui.close();
end
dap.listeners.after.event_exited['dapui'] = function()
    dapui.close();
end

-- enabel virtual text

local dap_virtual_text_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not dap_virtual_text_ok then
    print("DAP Virtual text could not be loaded")
    return
end

dap_virtual_text.setup();
