return {
  "Civitasv/cmake-tools.nvim",
  opts = {
    cmake_command = "cmake", -- CMake executable to use
    cmake_regenerate_on_save = true, -- Regenerate build files on save
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- Always generate compile_commands.json
    cmake_build_directory = "build", -- Default build directory name
    cmake_variants_message = {
      short = { show = true }, -- Short message
      long = { show = true, max_length = 40 }, -- Long message
    },
  },
  config = function(_, opts)
    require("cmake-tools").setup(opts)
  end,
}
