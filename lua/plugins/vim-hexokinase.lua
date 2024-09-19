-- ~/.config/nvim/lua/plugins/hexokinase.lua
return {
    'rrethy/vim-hexokinase',
    run = 'make hexokinase',
    config = function()
        vim.g.Hexokinase_highlighters = {'virtual', 'sign_column', 'background'}
        vim.g.Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'
    end
}
