-- ~/.config/nvim/lua/plugins/bufferline.lua
return {
    'akinsho/bufferline.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('bufferline').setup {
            options = {
                numbers = "buffer_id", -- or "ordinal" or "both" or function
                close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
                right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
                left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
                middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
                indicator = {
                    icon = '▎', -- this should be omitted if indicator style is not 'icon'
                    style = 'icon', -- 'icon' | 'underline' | 'none',
                },
                buffer_close_icon = '',
                modified_icon = '●',
                close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',
                max_name_length = 18,
                max_prefix_length = 15, -- prefix used when a buffer is deduplicated
                tab_size = 18,
                diagnostics = false, -- or "nvim_lsp"
                diagnostics_update_in_insert = false,
                offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left" }},
                show_buffer_icons = true, -- disable filetype icons for buffers
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' }
                enforce_regular_tabs = false,
                always_show_bufferline = true,
                sort_by = 'id', -- 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
            }
        }
    end
}
