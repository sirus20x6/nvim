-- ~/.config/nvim/lua/plugins/editor.lua
return {
  -- Treesitter for better syntax highlighting and code understanding
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "c",
        "cpp",
        "cmake",
        "make",
        "ninja",
        "go",
        "javascript",
        "json",
        "lua",
        "python",
        "rust",
        "typescript",
        "vim",
        "yaml",
      })
      opts.highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
      opts.indent = { enable = true }
      opts.autotag = { enable = true }
      opts.rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      }
    end,
  },

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
    },
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },

  -- Rainbow indent lines
  {
    "TheGLander/indent-rainbowline.nvim",
    dependencies = {
      "lukas-reineke/indent-blankline.nvim",
    },
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
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#00E676" })    -- Neon Green
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#D500F9" })   -- Electric Purple
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#00B8D4" })     -- Bright Cyan
      end)

      require("ibl").setup({
        indent = { highlight = highlight },
        whitespace = {
          highlight = highlight,
          remove_blankline_trail = false,
        },
        scope = { enabled = false },
      })
    end,
  },

  -- Easy motion plugin
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },

  -- Surrounding text objects
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.ai").setup(opts)
    end,
  },

  -- Automatic pair insertion
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },

  -- Rainbow delimiters
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["global"],
          cpp = rainbow_delimiters.strategy["global"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-delimiters",
          vim = "rainbow-delimiters",
          cpp = "rainbow-delimiters",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },

  -- Color highlighter
  {
    "RRethy/vim-hexokinase",
    build = "make hexokinase",
    config = function()
      vim.g.Hexokinase_highlighters = { "virtual", "sign_column", "background" }
      vim.g.Hexokinase_optInPatterns = "full_hex,rgb,rgba,hsl,hsla,colour_names"
    end,
  },

  -- Personal wiki
  {
    "vimwiki/vimwiki",
    ft = { "vimwiki" },
    config = function()
      vim.g.vimwiki_list = {
        {
          path = "~/vimwiki/",
          syntax = "markdown",
          ext = ".md",
        },
      }
      vim.g.vimwiki_global_ext = 0
    end,
  },

  -- Repeat plugin
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
}
