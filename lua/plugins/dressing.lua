-- ~/.config/nvim/lua/plugins/dressing.lua

return {
    'stevearc/dressing.nvim',
    event = "BufWinEnter", -- Load when a buffer window is entered
    config = function()
        require('dressing').setup({
            input = {
                -- Set default prompt options
                default_prompt = "Input:",
                -- Override default prompt behavior (optional)
                prompt_align = "center",
                -- Additional settings
            },
            select = {
                -- Override default select options (optional)
                backend = { "telescope", "fzf", "builtin" },
                -- Additional settings
            },
        })
    end
}
