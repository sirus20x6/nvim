-- ~/.config/nvim/lua/plugins/cpp/cpp-specific-plugins.lua
return {
  {
    "Badhi/nvim-treesitter-cpp-tools",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nt-cpp-tools").setup({
        preview = {
          quit = "q",
          accept = "<tab>",
        },
        header_extension = "h",
        source_extension = "cxx",
        custom_define_class_function_commands = {
          TSCppImplWrite = {
            output_handle = require("nt-cpp-tools.output_handlers").get_add_to_cpp(),
          },
        },
      })
    end,
  },
}
