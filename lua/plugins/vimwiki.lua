-- ~/.config/nvim/lua/plugins/vimwiki.lua
return {
    'vimwiki/vimwiki',
    ft = { 'vimwiki' }, -- Load only for vimwiki files
    config = function()
        vim.g.vimwiki_list = {
            {
                path = '~/vimwiki/',
                syntax = 'markdown',
                ext = '.md',
            }
        }
        vim.g.vimwiki_global_ext = 0
    end
}
