return {
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { "baliestri/aura-theme", name = "aura-theme" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "catppuccin/nvim", name = "catppuccin" },
  { 'sainnhe/everforest', lazy = false, priority = 1000 },
  { "eldritch-theme/eldritch.nvim", lazy = false, priority = 1000, opts = {}},
  { "akinsho/horizon.nvim", version= "*" },
  { "sho-87/kanagawa-paper.nvim", lazy = false, opts = {}},
  { 'tanvirtin/monokai.nvim' },
  { 'olivercederborg/poimandres.nvim',
      lazy = false,
      priority = 1000,
      config = function() require('poimandres').setup {} end
  },
  { 'shaunsingh/moonlight.nvim' },
  {'rebelot/kanagawa.nvim'},
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {
        style = 'vulgaris',
      }
      require('bamboo').load()
    end,
  },
  {
    "water-sucks/darkrose.nvim",
    lazy = false,
    priority = 1000,
  },
  {'NTBBloodbath/doom-one.nvim'},
  {"DeviusVim/deviuspro.nvim"},
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
  {
  "xero/miasma.nvim",
  lazy = false,
  priority = 1000,
  config = function()
      vim.cmd("colorscheme miasma")
    end,
  },
  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
  },
  {"sainttttt/flesh-and-blood"},
}
