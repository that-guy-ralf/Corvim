-- Colorscheme based on the medevac.jpg wallpaper (deep red helicopter as primary)
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "medevac"
vim.o.background = "dark"
vim.o.termguicolors = true

local c = {
  bg = "#141414",
  bg_alt = "#1d1d1d",
  fg = "#e4e4e4",
  dim = "#8a8a8a",
  red = "#813939",    -- primary: helicopter deep red (sampled)
  red_hi = "#b04a4a", -- derived: keywords, errors
  navy = "#1d2637",   -- livery stripe (sampled)
  teal = "#6f9a9a",   -- derived from tree shadow
  sand = "#c9b79c",   -- derived: strings, constants
  none = "NONE",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Transparent Normal so the Warp window opacity shows through
hl("Normal", { fg = c.fg, bg = c.none })
hl("NormalFloat", { fg = c.fg, bg = c.bg_alt })
hl("SignColumn", { bg = c.none })
hl("EndOfBuffer", { fg = c.bg_alt, bg = c.none })

hl("Comment", { fg = c.dim, italic = true })
hl("Keyword", { fg = c.red_hi, bold = true })
hl("Statement", { link = "Keyword" })
hl("String", { fg = c.sand })
hl("Constant", { fg = c.sand })
hl("Function", { fg = c.fg, bold = true })
hl("Identifier", { fg = c.fg })
hl("Type", { fg = c.teal })
hl("Directory", { fg = c.teal })
hl("Special", { fg = c.red_hi })

hl("Visual", { bg = c.navy })
hl("Search", { fg = c.fg, bg = c.red })
hl("IncSearch", { fg = c.bg, bg = c.red_hi })
hl("CursorLine", { bg = c.bg_alt })
hl("CursorLineNr", { fg = c.red_hi, bold = true })
hl("LineNr", { fg = c.dim })
hl("StatusLine", { fg = c.fg, bg = c.red })
hl("StatusLineNC", { fg = c.dim, bg = c.bg_alt })
hl("VertSplit", { fg = c.red, bg = c.none })
hl("WinSeparator", { fg = c.red, bg = c.none })
hl("Pmenu", { fg = c.fg, bg = c.bg_alt })
hl("PmenuSel", { fg = c.fg, bg = c.navy })
hl("ErrorMsg", { fg = c.red_hi, bold = true })
hl("WarningMsg", { fg = c.sand })
hl("MatchParen", { fg = c.red_hi, bold = true })

hl("DiagnosticError", { fg = c.red_hi })
hl("DiagnosticWarn", { fg = c.sand })
hl("DiagnosticInfo", { fg = c.teal })
hl("DiagnosticHint", { fg = c.dim })

-- Treesitter groups (@keyword, @string, ...) link to the groups above by default
