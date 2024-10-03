-- ~/.config/nvim/lua/plugins/indent-blankline.lua
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    local highlight = {
      "RainbowPurple",
      "RainbowBlue",
      "RainbowPink",
      "RainbowCyan",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
    }
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowPink", { fg = "#FF00FF" })     -- Outrun Pink
      vim.api.nvim_set_hl(0, "RainbowPurple", { fg = "#B700FF" })   -- Outrun Purple
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#00E5FF" })     -- Electric Blue
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FF9100" })   -- Neon Orange
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#00ff76" })    -- Neon Green
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#D500F9" })   -- Electric Purple
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#00B8D4" })     -- Bright Cyan
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
