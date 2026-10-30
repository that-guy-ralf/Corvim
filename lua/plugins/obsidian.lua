return {
  "obsidian-nvim/obsidian.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    workspaces = {
      { name = "Esoterica", path = "~/Obsidian/Esoterica" },
      { name = "Workspace", path = "~/Obsidian/Workspace" },
    },
    picker = { name = "snacks.picker" },
  }
}
