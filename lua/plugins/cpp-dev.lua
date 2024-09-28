-- ~/.config/nvim/lua/plugins/cpp-dev.lua
return {
  require("plugins.cpp-lsp-config"),
  require("plugins.cpp.autocomplete-config"),
  require("plugins.cpp.debug-config"),
  require("plugins.cpp.cmake-config"),
  require("plugins.cpp.specific-plugins"),
  require("plugins.cpp.code-navigation"),
  require("plugins.cpp.formatting-linting"),
  require("plugins.cpp.godot-integration"), -- New file for Godot-specific configurations
}
