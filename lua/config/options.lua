-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Set GUI font to Fira Mono
opt.guifont = "Fira Mono:h11"

-- If you're using Neovim in a terminal that supports font changes, you can use:
-- opt.guifont = { "Fira Mono", ":h11" }

-- Additional options you might want to consider:
opt.linespace = 0  -- Set the space between lines
opt.guifontwide = "Fira Mono:h11"  -- Set the font for double-width characters

-- If you want to ensure Fira Mono is used in Neovide:
if vim.g.neovide then
    vim.o.guifont = "Fira Mono:h11"
end

-- You can add other custom options here as well
-- For example:
-- opt.colorcolumn = "80"  -- Show a vertical line at column 80
-- opt.scrolloff = 8  -- Keep 8 lines above/below cursor when scrolling
