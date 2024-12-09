-- return {
--   'nvim-lualine/lualine.nvim',
--   dependencies = { 'nvim-tree/nvim-web-devicons' },
--   config = function ()
--     require('lualine').setup({
--       theme = "modus-vivendi"
--     })
--   end,
-- }
return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "bwpge/lualine-pretty-path",
    },
    opts = {
        sections = {
            lualine_c = { "pretty_path" }
        },
        inactive_sections = {
            lualine_c = { "pretty_path" }
        }
    },
}
