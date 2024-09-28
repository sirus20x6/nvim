-- ~/.config/nvim/lua/plugins/cpp/cpp-debug-config.lua
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    dap.adapters.lldb = {
      type = "executable",
      command = "/usr/bin/lldb-vscode", -- Adjust path as needed
      name = "lldb",
    }
    dap.configurations.cpp = {
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
        env = function()
          local variables = {}
          for k, v in pairs(vim.fn.environ()) do
            table.insert(variables, string.format("%s=%s", k, v))
          end
          return variables
        end,
      },
      {
        name = "Attach to process",
        type = "lldb",
        request = "attach",
        pid = require("dap.utils").pick_process,
        args = {},
      },
    }

    require("dapui").setup()
    require("nvim-dap-virtual-text").setup()

    -- Keybindings for debugging
    vim.api.nvim_set_keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
    vim.api.nvim_set_keymap(
      "n",
      "<leader>B",
      ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
      { silent = true }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>lp",
      ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
      { silent = true }
    )
    vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", { silent = true })
  end,
}
