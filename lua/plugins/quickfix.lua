-- ~/.config/nvim/lua/plugins/quickfix.lua
return {
  {
    "folke/trouble.nvim",
    opts = function(_, opts)
      -- Extend the existing trouble configuration
      return vim.tbl_extend("force", opts or {}, {
        position = "bottom",
        height = 10,
        icons = true,
        mode = "document_diagnostics",
        fold_open = "",
        fold_closed = "",
        group = true,
        padding = true,
        cycle_results = true,
        action_keys = {
          -- key mappings for actions in the trouble list
          close = "q", -- close the list
          cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
          refresh = "r", -- manually refresh
          jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
          open_split = { "<c-x>" }, -- open buffer in new split
          open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
          open_tab = { "<c-t>" }, -- open buffer in new tab
          toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
          switch_severity = "s", -- switch "diagnostics" severity filter level
          toggle_preview = "P", -- toggle auto_preview
          hover = "K", -- opens a small popup with the full multiline message
          preview = "p", -- preview the diagnostic location
          close_folds = { "zM", "zm" }, -- close all folds
          open_folds = { "zR", "zr" }, -- open all folds
          toggle_fold = { "zA", "za" }, -- toggle fold of current file
          previous = "k", -- previous item
          next = "j", -- next item
        },
      })
    end,
    keys = {
      -- Additional keybindings for quickfix interaction
      { "<leader>qf", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
      { "<leader>qw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
      { "<leader>qd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
      { "<leader>ql", "<cmd>TroubleToggle loclist<cr>", desc = "Location List" },
      { "]q", "<cmd>cnext<cr>", desc = "Next Quickfix Item" },
      { "[q", "<cmd>cprev<cr>", desc = "Previous Quickfix Item" },
      { "]l", "<cmd>lnext<cr>", desc = "Next Location List Item" },
      { "[l", "<cmd>lprev<cr>", desc = "Previous Location List Item" },
    },
  },
  
  -- Optional: Add a test command to verify quickfix functionality
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>q"] = { name = "+quickfix" },
      },
    },
  },
}