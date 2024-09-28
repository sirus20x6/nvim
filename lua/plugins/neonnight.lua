return {
  "sirus20x6/neonnight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "moon",
      -- Add any other configuration options here
    })
    vim.cmd([[colorscheme tokyonight-moon]])
  end,
}