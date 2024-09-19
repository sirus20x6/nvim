return {
  "nvim-treesitter/nvim-treesitter",
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
}
