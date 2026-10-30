return {
    'ankushbhagats/liveserver.nvim',
    event = { "BufReadPost", "BufNewFile" },
    build = 'npm i',
    module = false,
    opts = {
      colortype = "hex", -- hex | hl
      args = { -- accepts live-server cli arguments.
        port = 8080,
        ["no-browser"] = false,
        -- filetypes = "*", -- show lualine component for all files.
        -- ... add more ...
      },
    },
    config = true
}
