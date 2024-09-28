-- ~/.config/nvim/lua/plugins/indent-blankline.lua
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require("ibl.hooks")
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ff0000" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#ffff00" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#00a9ff" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#ff9000" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#00ff00" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#ff00ff" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#00ffff" })
    end)

    -- Configure rainbow delimiters
    vim.g.rainbow_delimiters = { highlight = highlight }

    require("ibl").setup({
      indent = { highlight = highlight, char = "▏" },
      whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
      },
      scope = {
        enabled = true,
        highlight = highlight,
        char = "┃",
        show_start = true,
        show_end = true,
        injected_languages = true,
        priority = 1024,
      },
    })

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
  },
}
