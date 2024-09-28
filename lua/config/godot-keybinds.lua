-- ~/.config/nvim/lua/config/godot-keybinds.lua
local M = {}

function M.setup()
  -- Custom commands
  vim.api.nvim_create_user_command("CMakeConfigure", function()
    vim.cmd("AsyncRun cmake -B build -S .")
  end, {})

  vim.api.nvim_create_user_command("CMakeBuild", function()
    vim.cmd("AsyncRun cmake --build build")
  end, {})

  -- Keybindings
  local opts = { noremap = true, silent = true }

  -- CMake
  vim.api.nvim_set_keymap("n", "<leader>cc", ":CMakeConfigure<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>cb", ":CMakeBuild<CR>", opts)

  -- Run Godot
  vim.api.nvim_set_keymap("n", "<leader>gr", ":RunGodotProject<CR>", opts)

  -- Debugging
  vim.api.nvim_set_keymap("n", "<leader>dd", ":lua require'dap'.continue()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>dn", ":lua require'dap'.step_over()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>di", ":lua require'dap'.step_into()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>do", ":lua require'dap'.step_out()<CR>", opts)

  -- LSP
  vim.api.nvim_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
end

return M
