-- ~/.config/nvim/lua/plugins/luasnip.lua

-- Load LuaSnip plugin
return {
    'L3MON4D3/LuaSnip',
    event = "InsertEnter",
    config = function()
        local luasnip = require("luasnip")

        -- Load snippets from friendly-snippets
        require("luasnip.loaders.from_vscode").lazy_load()

        -- Optionally, configure LuaSnip settings here
        luasnip.config.set_config({
            -- Add LuaSnip configuration options here
            history = true,
            updateevents = "TextChanged,TextChangedI",
        })

        -- Optionally, add custom snippets here
        -- require("luasnip.loaders.from_snipmate").load({
        --     paths = {"./my-snippets"}
        -- })
    end
}
