-- In your Neovim configuration file (e.g., ~/.config/nvim/lua/plugins/formatting.lua)
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },
    },
    formatters = {
      clang_format = {
        -- This tells conform.nvim to look for .clang-format in the project root
        -- If not found, it will fall back to the default clang-format style
        args = { "--style=file" },
      },
    },
  },
}
