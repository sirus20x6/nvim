-- lsp-zero.lua
return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v1.x",
  requires = {
    -- LSP Support
    { "neovim/nvim-lspconfig" }, -- Required
    { "williamboman/mason.nvim" }, -- Optional
    { "williamboman/mason-lspconfig.nvim" }, -- Optional

    -- Autocompletion
    { "hrsh7th/nvim-cmp" }, -- Required
    { "hrsh7th/cmp-nvim-lsp" }, -- Required
    { "hrsh7th/cmp-buffer" }, -- Optional
    { "hrsh7th/cmp-path" }, -- Optional
    { "hrsh7th/cmp-nvim-lua" }, -- Optional

    -- Snippets
    { "L3MON4D3/LuaSnip" }, -- Required
    { "saadparwaiz1/cmp_luasnip" }, -- Optional
    { "rafamadriz/friendly-snippets" }, -- Optional
  },
  config = function()
    local lsp = require("lsp-zero")

    lsp.preset("recommended")

    lsp.ensure_installed({
      "eslint",
      "pyright",
      "gopls",
      -- Add more LSP servers here
    })

    -- Configure lua language server for neovim
    lsp.nvim_workspace()

    lsp.setup_nvim_cmp({
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "nvim_lua" },
      },
    })

    lsp.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }
      local bind = vim.keymap.set

      bind("n", "gd", vim.lsp.buf.definition, opts)
      bind("n", "K", vim.lsp.buf.hover, opts)
      bind("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
      bind("n", "<leader>vd", vim.diagnostic.open_float, opts)
      bind("n", "[d", vim.diagnostic.goto_next, opts)
      bind("n", "]d", vim.diagnostic.goto_prev, opts)
      bind("n", "<leader>vca", vim.lsp.buf.code_action, opts)
      bind("n", "<leader>vrr", vim.lsp.buf.references, opts)
      bind("n", "<leader>vrn", vim.lsp.buf.rename, opts)
      bind("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    end)

    lsp.setup()
  end,
}
