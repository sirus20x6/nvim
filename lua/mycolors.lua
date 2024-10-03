-- Define your color palette
local palette = {
  bg = "#010113",  -- Dark background with a slight bluish tint
  bg_dark = "#010103",  -- Even darker background for contrast
  bg_highlight = "#010103",  -- Highlight background for elements
  blue = "#00caff",  -- Neon electric blue
  blue0 = "#009aff",  -- Bright, vibrant blue
  blue1 = "#10a0ff",  -- Lighter neon blue
  blue2 = "#30f4ff",  -- More neon, glowing blue
  blue5 = "#40ffff",  -- Almost white-blue
  blue6 = "#50ffff",  -- Soft neon cyan
  blue7 = "#2070ff",  -- Muted blue for contrast
  comment = "#53ff60",  -- Neon greenish comment
  cyan = "#00ffff",  -- Pure neon cyan
  dark3 = "#0222b0",  -- Darker neutral color
  dark5 = "#636b80",  -- Another neutral tone for subtle elements
  fg = "#fff8ff",  -- Bright white with slight neon tint
  fg_dark = "#ed3e84",  -- Softer white for dimmed elements
  fg_gutter = "#1b44f7",  -- Gutter color with neutral tone
  green = "#00ff66",  -- Neon green with high saturation
  green1 = "#60ffa0",  -- Slightly toned-down neon green
  green2 = "#40ff99",  -- Medium neon green for accents
  magenta = "#ff00ff",  -- Pure neon magenta
  magenta2 = "#ff00b0",  -- Vibrant pinkish-magenta
  orange = "#ff9000",  -- Bright orange for contrast
  purple = "#bf00ff",  -- Vibrant neon purple
  red = "#ff0033",  -- Slightly more saturated red
  red1 = "#ff0000",  -- Pure red for stronger highlights
  teal = "#00ffea",  -- Neon teal with an electric glow
  terminal_black = "#05051a",  -- Deep neutral black
  yellow = "#ffff00",  -- Neon yellow, bright and saturated
  git = {
    add = "#00ff60",  -- Neon green for git additions
    change = "#00a9ff",  -- Vibrant blue for changes
    delete = "#ff0066",  -- Hot pinkish-red for deletions
  },
}

-- Set the highlights
local function apply_highlights()
  -- Highlights for active and inactive buffers
  local highlights = {
    -- Active buffer
    Normal = { fg = palette.fg, bg = palette.bg },
    -- Inactive buffer
    NormalNC = { fg = palette.fg_dark, bg = palette.bg_dark },
    -- Comment
    Comment = { fg = palette.comment, italic = true },
    -- Syntax groups
    Constant = { fg = palette.blue },
    String = { fg = palette.green },
    Identifier = { fg = palette.blue1 },
    Statement = { fg = palette.red },
    Keyword = { fg = palette.purple },
    Function = { fg = palette.blue2 },
    Type = { fg = palette.yellow },
    Number = { fg = palette.orange },
    Boolean = { fg = palette.orange },
    Operator = { fg = palette.teal },
    -- Git related highlights
    DiffAdd = { fg = palette.git.add },
    DiffChange = { fg = palette.git.change },
    DiffDelete = { fg = palette.git.delete },
    -- Line numbers and gutter
    LineNr = { fg = palette.dark3 },
    CursorLineNr = { fg = palette.blue },
    -- Status line
    StatusLine = { fg = palette.fg, bg = palette.bg_highlight },
    StatusLineNC = { fg = palette.fg_dark, bg = palette.bg_dark },
    -- Popup menu
    Pmenu = { bg = palette.bg_dark },
    PmenuSel = { fg = palette.fg, bg = palette.blue0 },
    -- Visual and Cursor highlights
    Visual = { bg = palette.bg_highlight },
    CursorLine = { bg = palette.bg_highlight },
  }

  -- Apply highlights
  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

-- Apply additional highlights for specific elements
local function apply_specific_highlights()
  -- Terminal adjustments
  vim.api.nvim_set_hl(0, 'Terminal', { bg = palette.bg_dark, fg = palette.fg })
  vim.api.nvim_set_hl(0, 'TermCursor', { fg = palette.fg, bg = palette.blue })

  -- NeoTree adjustments
  vim.api.nvim_set_hl(0, 'NeoTreeNormal', { fg = palette.fg_dark, bg = palette.bg_dark })
  vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { fg = palette.fg_dark, bg = palette.bg_dark })
  vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = palette.blue7 })
  vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = palette.blue7 })
  vim.api.nvim_set_hl(0, 'NeoTreeGitAdded', { fg = palette.git.add })
  vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = palette.git.change })
  vim.api.nvim_set_hl(0, 'NeoTreeGitDeleted', { fg = palette.git.delete })
end

-- Apply the highlights
apply_highlights()
apply_specific_highlights()

-- Optional: set some terminal colors
vim.g.terminal_color_0 = palette.terminal_black
vim.g.terminal_color_1 = palette.red
vim.g.terminal_color_2 = palette.green
vim.g.terminal_color_3 = palette.yellow
vim.g.terminal_color_4 = palette.blue
vim.g.terminal_color_5 = palette.magenta
vim.g.terminal_color_6 = palette.cyan
vim.g.terminal_color_7 = palette.fg
vim.g.terminal_color_8 = palette.dark3
vim.g.terminal_color_9 = palette.red1
vim.g.terminal_color_10 = palette.green1
vim.g.terminal_color_11 = palette.yellow
vim.g.terminal_color_12 = palette.blue0
vim.g.terminal_color_13 = palette.magenta2
vim.g.terminal_color_14 = palette.teal
vim.g.terminal_color_15 = palette.fg_dark
