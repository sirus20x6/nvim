-- ~/.config/nvim/lua/plugins/avante.lua
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this to false to always pull the latest changes
  opts = {
    -- Add any additional options here
  },
  build = "make", -- Use "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" for Windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- Optional dependencies
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true, -- required for Windows users
        },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  config = function()
    -- Set up global statusline
    vim.opt.laststatus = 3

    -- Load Avante lib
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        require('avante_lib').load()
      end,
    })
  end,
}