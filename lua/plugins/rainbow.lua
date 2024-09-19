-- ~/.config/nvim/lua/plugins/rainbow.lua
return {
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    local rainbow_delimiters = require('rainbow-delimiters')

    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],  -- Apply global strategy to all file types by default
        vim = rainbow_delimiters.strategy['global'],   -- Apply global strategy to Vim script files
        cpp = rainbow_delimiters.strategy['global'],   -- Apply global strategy to C++ files
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-delimiters',
        vim = 'rainbow-delimiters',
        cpp = 'rainbow-delimiters',
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }
  end,
  requires = {
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  }
}
