return {
    'nvim-neo-tree/neo-tree.nvim',
    keys = {
      { '<leader>n', '<cmd>Neotree toggle right<CR>' },
      { '<leader>bf', '<cmd>Neotree buffers toggle float<CR>' }
    },
    branch = 'v3.x',
    dependencies = {
      'nvim-ua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    },
    config = function()
      require('neo-tree').setup({
        sources = {
          'filesystem',
          'buffers',
          'git_status',
        },
        source_selector = {
          winbar = true,
          statusline = false, -- toggle to show selector on statusline
          content_layout = 'center',
          tabs_layout = 'equal',
          sources = {
            { source = 'filesystem', display_name = 'Files' },
            { source = 'buffers', display_name = 'Buffers' },
            { source = 'git_status', display_name = 'Git' },
          },
        },
    })
    end,
}
