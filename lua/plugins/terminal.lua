-- ~/.config/nvim/lua/plugins/terminal.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 12,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,  -- Adjust the shading factor to darken the terminal
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",  -- Use your existing theme's border color
          background = "Normal",  -- Use your theme's background for the terminal
        },
      },
    })

    -- Function to open the terminal on startup
    local function open_terminal_on_startup()
      local term = require("toggleterm.terminal").Terminal:new({
        count = 1,
        direction = "horizontal",
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end,
        on_close = function()
          vim.cmd("startinsert!")
        end,
      })
      term:toggle()
    end

    -- Autocommand to open terminal on startup
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        open_terminal_on_startup()
      end,
    })

    -- Optional: Add a command to manually toggle the terminal
    vim.api.nvim_create_user_command("ToggleTerminal", function()
      require("toggleterm").toggle()
    end, {})

    -- Optional: Add a keybinding to toggle the terminal
    vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>ToggleTerminal<CR>", {noremap = true, silent = true})
  end,
}
