-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.godot-keybinds").setup()
require("plugins.indent-blankline")
require("plugins.rainbow")
require("plugins.telescope")
require("plugins.zig")
require("plugins.editor")
require("mycolors")
