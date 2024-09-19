-- Place this in a new file, e.g., ~/.config/nvim/lua/plugins/lsp-keybinds.lua

return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- Change or add keybindings here
    keys[#keys + 1] = { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } }
    
    -- If you want to keep the default <leader>ca and add <leader>a as an alternative:
    -- keys[#keys + 1] = { "<leader>a", vim.lsp.buf.code_action, desc = "Code Action (Alt)", mode = { "n", "v" } }
  end,
}