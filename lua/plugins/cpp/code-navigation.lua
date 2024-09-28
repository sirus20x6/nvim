-- ~/.config/nvim/lua/plugins/cpp/cpp-code-navigation.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        file_ignore_patterns = { "build/", "out/", ".git/" },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })
    telescope.load_extension("ui-select")

    -- Keybindings for Telescope
    vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", { silent = true })

    -- Quick navigation between header and source files
    vim.api.nvim_set_keymap("n", "<leader>oh", ":ClangdSwitchSourceHeader<CR>", { silent = true })
  end,
}
