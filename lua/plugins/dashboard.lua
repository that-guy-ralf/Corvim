-- Corvim start screen, built on the snacks.nvim dashboard.
--
-- snacks.nvim itself is set up in snacks.lua. lazy.nvim merges the `opts` of every
-- spec for the same plugin, so all dashboard settings live in this file.

-- Glyph key: block characters = crow, ● = eye, ▓ ▒ = branch.
local crow = {
  "            ▗▄▟████▙▄",
  "          ▄▟██████████▄",
  "     ▗▄▟███████████████▙",
  "  ▄▟████████████████████▙▖",
  "▟█████████████████████████▙▖",
  "       ▀▀▀▀▜█████████████████▄",
  "            ▝██████████████████▄",
  "             ██▛▜███████████████▙▖",
  "            ▐██▙ █████████████████▖",
  "            ▐███▌▝█████████████████▖",
  "             ▜███▄▝█████████████████▖",
  "             ▝████▙▖▀████████████████▖",
  "              ▝▜████▙▖▀▀██████████████",
  "                ▀██████▙▄▝▀▀██████████▙",
  "                  ▝▀███████▙▄▄▖▀▀▀█████▙",
  "                     ▝▀█▛█████████▄▄████▙",
  "                      ▗█   ▐█    ▀▜█████▀",
  "                      ▐█   ▐█       ▀████▄",
  "                      ▐▛   ▐█         ▀████▄▖",
  "                  ▗▄▄▄█▙▄▄▄▟█▄▄▄        ▀████▌",
  "▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒",
}

-- "CORVIM" in the ANSI Shadow figlet font.
local title = {
  " ██████╗ ██████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
  "██╔════╝██╔═══██╗██╔══██╗██║   ██║██║████╗ ████║",
  "██║     ██║   ██║██████╔╝██║   ██║██║██╔████╔██║",
  "██║     ██║   ██║██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║",
  "╚██████╗╚██████╔╝██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║",
  " ╚═════╝ ╚═════╝ ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
}

-- Each value is either a highlight group to link to (so the colors follow your
-- colorscheme) or an explicit definition such as { fg = "#7aa2f7", bold = true }.
local highlights = {
  CorvimCrow = "Function",
  CorvimEye = "DiagnosticError",
  CorvimBranch = "Comment",
  CorvimTitle = "Title",
  CorvimTitleShadow = "Comment",
}

local function crow_hl(glyph)
  if glyph == "●" then
    return "CorvimEye"
  elseif glyph == "▓" or glyph == "▒" then
    return "CorvimBranch"
  end
  return "CorvimCrow"
end

local function title_hl(glyph)
  return glyph == "█" and "CorvimTitle" or "CorvimTitleShadow"
end

--- Convert art lines into dashboard text chunks, colored per glyph.
--- Lines are padded to a common width because the dashboard centers every line
--- independently, which would otherwise skew the art.
---@param lines string[]
---@param hl_for fun(glyph: string): string
---@return snacks.dashboard.Text[]
local function art(lines, hl_for)
  local width = 0
  for _, line in ipairs(lines) do
    width = math.max(width, vim.api.nvim_strwidth(line))
  end

  local chunks = {}
  for i, line in ipairs(lines) do
    local glyphs = vim.fn.split(line .. (" "):rep(width - vim.api.nvim_strwidth(line)), "\\zs")
    if i < #lines then
      glyphs[#glyphs + 1] = "\n"
    end
    for _, glyph in ipairs(glyphs) do
      local last = chunks[#chunks]
      local hl
      if glyph:match("%s") and last then
        hl = last.hl -- whitespace keeps the current color so runs stay long
      else
        hl = hl_for(glyph)
      end
      if last and last.hl == hl then
        last[1] = last[1] .. glyph
      else
        chunks[#chunks + 1] = { glyph, hl = hl }
      end
    end
  end
  return chunks
end

--- Decide what fits in the window: everything, then drop the shortcuts, then the crow.
local function layout()
  local rows = vim.o.lines - vim.o.cmdheight
  local crow_h, title_h, keys_h, footer_h = #crow + 1, #title + 2, 8, 1
  local full = crow_h + title_h + keys_h + footer_h
  if rows >= full then
    return { crow = true, keys = true }
  elseif rows >= full - keys_h then
    return { crow = true, keys = false }
  end
  return { crow = false, keys = true }
end

return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    require("snacks").util.set_hl(highlights, { default = true })

    opts.dashboard = {
      enabled = true,
      sections = {
        {
          text = art(crow, crow_hl),
          align = "center",
          padding = 1,
          enabled = function()
            return layout().crow
          end,
        },
        { text = art(title, title_hl), align = "center", padding = 2 },
        {
          section = "keys",
          padding = 1,
          enabled = function()
            return layout().keys
          end,
        },
        { section = "startup" },
      },
    }
  end,
}
