-- ~/.config/nvim/lua/plugins/zig.lua
return {
  -- Treesitter configuration for Zig
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "zig" })
      end
    end,
  },

  -- LSP configuration for Zig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zls = {
          -- Ensure zls is configured to provide diagnostics
          init_options = {
            semantic_tokens = true,
            snippets = true,
          },
          settings = {
            zig = {
              -- Enable all features for better integration
              checkOnSave = true,
              buildOnSave = true,
              autoFormatting = true,
            },
          },
        },
      },
    },
  },

  -- Formatter configuration for Zig
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        zig = { "zigfmt" },
      },
    },
  },

  -- Linter configuration for Zig
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        zig = { "zls" },
      },
    },
  },

  -- Debugging support for Zig
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "codelldb")
        end,
      },
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters.codelldb then
        require("dap").adapters.codelldb = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "codelldb",
            args = { "--port", "${port}" },
          },
        }
      end
      dap.configurations.zig = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }
    end,
  },

  -- Trouble.nvim integration
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      position = "bottom",
      height = 10,
      width = 50,
      icons = true,
      mode = "workspace_diagnostics",
      fold_open = "",
      fold_closed = "",
      group = true,
      padding = true,
      action_keys = {
        close = "q",
        cancel = "<esc>",
        refresh = "r",
        jump = {"<cr>", "<tab>"},
        open_split = { "<c-x>" },
        open_vsplit = { "<c-v>" },
        open_tab = { "<c-t>" },
        jump_close = {"o"},
        toggle_mode = "m",
        toggle_preview = "P",
        hover = "K",
        preview = "p",
        close_folds = {"zM", "zm"},
        open_folds = {"zR", "zr"},
        toggle_fold = {"zA", "za"},
        previous = "k",
        next = "j"
      },
      indent_lines = true,
      auto_open = false,
      auto_close = false,
      auto_preview = true,
      auto_fold = false,
      auto_jump = {"lsp_definitions"},
      signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
      },
      use_diagnostic_signs = false
    },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Location List" },
      { "gR", "<cmd>TroubleToggle lsp_references<cr>", desc = "LSP References" },
    },
  },

  -- Ensure Mason is configured to install Zig tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "zls", "codelldb" })
    end,
  },
}