return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    },
    config = function()
      vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle right<CR>', {})
      vim.keymap.set('n', '<leader>bf', ':Neotree buffers reveal float<CR>', {})
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
