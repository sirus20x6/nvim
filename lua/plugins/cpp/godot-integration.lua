-- ~/.config/nvim/lua/plugins/cpp/godot-integration.lua
return {
  -- LSP configuration for GDScript
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gdscript = {}, -- Enable GDScript LSP
      },
    },
  },

  -- Treesitter configuration for GDScript
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "gdscript" })
      end
    end,
  },

  -- Debugging support for Godot
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      dap.adapters.godot = {
        type = "server",
        host = "127.0.0.1",
        port = 6006,
      }
      dap.configurations.gdscript = {
        {
          type = "godot",
          request = "launch",
          name = "Launch scene",
          project = "${workspaceFolder}",
          launch_scene = true,
        },
      }
    end,
  },

  -- Add support for running Godot project
  {
    "skywind3000/asyncrun.vim",
    cmd = "AsyncRun",
    config = function()
      vim.api.nvim_create_user_command("RunGodotProject", function()
        vim.cmd("AsyncRun godot --path ${workspaceFolder}")
      end, {})
    end,
  },

  -- File explorer with better integration for Godot
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        ignore = false, -- Show git ignored files
      },
      filters = {
        custom = {
          "^.git$",
          "^.import$",
          "^.godot$",
        },
      },
    },
  },
}
