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
    config = function()
      local dap = require("dap")
      if not dap.adapters.codelldb then
        dap.adapters.codelldb = {
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

  -- Ensure zls and codelldb are installed
  {
    "williamboman/mason.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "zls", "codelldb" })
    end,
  },
}