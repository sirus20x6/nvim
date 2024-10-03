local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  log = { level = "debug" },
  rocks = {
    enabled = false, -- Disable luarocks
  },
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { import = "plugins" },
    -- import C++ development configuration
    { import = "plugins.cpp-dev" },
    { import = "plugins.neonnight" },
    { import = "plugins.telescope" },
    { import = "plugins.lualine" },
    { import = "plugins.indent-blankline" },
    { import = "plugins.lsp-zero" },
    { import = "plugins.lsp-keybinds" },
    { import = "plugins.trouble" },
    
    -- import Godot development configuration
    --{ import = "plugins.godot-gdextension" },
    -- import Zig development configuration
    { import = "plugins.zig" },
  },
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})