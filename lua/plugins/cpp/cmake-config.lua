-- ~/.config/nvim/lua/plugins/cpp/cmake-config.lua
return {
  "Civitasv/cmake-tools.nvim",
  opts = {
    cmake_command = "cmake",
    cmake_regenerate_on_save = true,
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
    cmake_build_directory = "build",
    cmake_build_directory_prefix = "${workspaceFolder}/build/", -- Align with VSCode setup
    cmake_build_type = "Debug",
    cmake_build_options = {},
    cmake_console_size = 10, -- cmake output window height
    cmake_show_console = "always", -- "always", "only_on_error"
    cmake_dap_configuration = { -- debug settings for cmake
      name = "cpp",
      type = "codelldb",
      request = "launch",
      stopOnEntry = false,
      runInTerminal = true,
      console = "integratedTerminal",
    },
    cmake_variants_message = {
      short = { show = true },
      long = { show = true, max_length = 40 },
    },
    cmake_always_use_terminal = false, -- if true, use terminal for cmake commands, else use quickfix
  },
  config = function(_, opts)
    require("cmake-tools").setup(opts)

    -- General CMake keybindings
    vim.api.nvim_set_keymap("n", "<leader>cg", ":CMakeGenerate<CR>", { silent = true, noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>cb", ":CMakeBuild<CR>", { silent = true, noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>cr", ":CMakeRun<CR>", { silent = true, noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>cd", ":CMakeDebug<CR>", { silent = true, noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>cc", ":CMakeClean<CR>", { silent = true, noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>ct", ":CMakeSelectBuildType<CR>", { silent = true, noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>cv", ":CMakeSelectBuildTarget<CR>", { silent = true, noremap = true })

    -- Godot-specific CMake configurations
    local cmake_tools = require("cmake-tools")

    -- Function to set up Godot-specific CMake configuration
    local function setup_godot_cmake()
      cmake_tools.setup({
        cmake_build_directory = "bin",
        cmake_generate_options = {
          "-DCMAKE_BUILD_TYPE=Debug",
          "-DCMAKE_EXPORT_COMPILE_COMMANDS=1",
          "-DCMAKE_INSTALL_PREFIX=./bin",
          "-GNinja",
        },
        cmake_build_options = {
          "--parallel",
        },
      })
    end

    -- Command to switch to Godot CMake configuration
    vim.api.nvim_create_user_command("CMakeSetupGodot", setup_godot_cmake, {})

    -- Godot-specific CMake keybindings
    vim.api.nvim_set_keymap("n", "<leader>csg", ":CMakeSetupGodot<CR>", { silent = true, noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>cgr", ":CMakeRun godot<CR>", { silent = true, noremap = true })

    -- Function to run Godot project
    local function run_godot_project()
      local godot_path = "/usr/bin/godot" -- Adjust this path as needed
      local project_path = vim.fn.getcwd()
      vim.fn.system(godot_path .. " --path " .. project_path)
    end

    -- Command to run Godot project
    vim.api.nvim_create_user_command("RunGodotProject", run_godot_project, {})

    -- Keybinding to run Godot project
    vim.api.nvim_set_keymap("n", "<leader>gr", ":RunGodotProject<CR>", { silent = true, noremap = true })

    -- Autocmd to detect Godot project and set up CMake accordingly
    vim.api.nvim_create_autocmd("VimEnter", {
      pattern = "*",
      callback = function()
        if vim.fn.filereadable("project.godot") == 1 then
          setup_godot_cmake()
          print("Godot project detected. CMake configuration adjusted.")
        end
      end,
    })
  end,
}
