return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.filesystem = opts.filesystem or {}
    opts.filesystem.filtered_items = opts.filesystem.filtered_items or {}
    opts.filesystem.filtered_items.hide_dotfiles = false
    opts.filesystem.filtered_items.hide_gitignored = false
    opts.filesystem.never_show = opts.filesystem.never_show or {}
    -- Remove "/" from the never_show list if it's there
    opts.filesystem.never_show = vim.tbl_filter(function(item)
      return item ~= "/"
    end, opts.filesystem.never_show)
    -- Explicitly allow "/"
    opts.filesystem.components = opts.filesystem.components or {}
    opts.filesystem.components.name = function(config, node, state)
      local highlights = require("neo-tree.ui.highlights")
      local icon = config.default_icon or " "
      local padding = config.padding or ""
      local name = node.name
      if node.type == "directory" and node.name == "/" then
        name = "/ (root)"
      end
      return {
        text = icon .. padding .. name,
        highlight = highlights.FILE_NAME,
      }
    end
  end,
}
