return {
    "folke/trouble.nvim",
    opts = {
      -- Detailed configuration from the defaults
      auto_close = false, -- auto close when there are no items
      auto_open = false, -- auto open when there are items
      auto_preview = true, -- automatically open preview when on an item
      auto_refresh = true, -- auto refresh when open
      auto_jump = false, -- auto jump to the item when there's only one
      focus = false, -- Focus the window when opened
      restore = true, -- restores the last location in the list when opening
      follow = true, -- Follow the current item
      indent_guides = true, -- show indent guides
      max_items = 200, -- limit number of items that can be displayed per section
      multiline = true, -- render multi-line messages
      pinned = false, -- When pinned, the opened trouble window will be bound to the current buffer
      warn_no_results = true, -- show a warning when there are no results
      open_no_results = false, -- open the trouble window when there are no results
      win = {}, -- window options for the results window. Can be a split or a floating window.
      preview = {
        type = "main",
        scratch = true, -- scratch buffer for preview
      },
      throttle = {
        refresh = 20, -- throttle refresh
        update = 10, -- throttle update
        render = 10, -- throttle render
        follow = 100, -- throttle follow
        preview = { ms = 100, debounce = true }, -- debounce preview
      },
      keys = {
        ["?"] = "help",
        r = "refresh",
        R = "toggle_refresh",
        q = "close",
        o = "jump_close",
        ["<esc>"] = "cancel",
        ["<cr>"] = "jump",
        ["<2-leftmouse>"] = "jump",
        ["<c-s>"] = "jump_split",
        ["<c-v>"] = "jump_vsplit",
        ["}"] = "next",
        ["]]"] = "next",
        ["{"] = "prev",
        ["[["] = "prev",
        dd = "delete",
        d = { action = "delete", mode = "v" },
        i = "inspect",
        p = "preview",
        P = "toggle_preview",
        gb = {
          action = function(view)
            view:filter({ buf = 0 }, { toggle = true })
          end,
          desc = "Toggle Current Buffer Filter",
        },
        s = {
          action = function(view)
            local f = view:get_filter("severity")
            local severity = ((f and f.filter.severity or 0) + 1) % 5
            view:filter({ severity = severity }, {
              id = "severity",
              template = "{hl:Title}Filter:{hl} {severity}",
              del = severity == 0,
            })
          end,
          desc = "Toggle Severity Filter",
        },
      },
      modes = {
        lsp_references = {
          params = { include_declaration = true },
        },
        lsp_base = {
          params = { include_current = false },
        },
        symbols = {
          desc = "document symbols",
          mode = "lsp_document_symbols",
          focus = false,
          win = { position = "right" },
          filter = {
            ["not"] = { ft = "lua", kind = "Package" },
            any = {
              ft = { "help", "markdown" },
              kind = {
                "Class", "Constructor", "Enum", "Field", "Function", "Interface", 
                "Method", "Module", "Namespace", "Package", "Property", "Struct", "Trait"
              },
            },
          },
        },
      },
      icons = {
        indent = {
          top = "│ ",
          middle = "├╴",
          last = "└╴",
          fold_open = " ",
          fold_closed = " ",
          ws = "  ",
        },
        folder_closed = " ",
        folder_open = " ",
        kinds = {
          Class = " ",
          Function = "󰊕 ",
          Method = "󰊕 ",
          Struct = "󰆼 ",
          Enum = " ",
        },
      },
    },
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    },
  }
  