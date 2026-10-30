return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-symbols.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = " Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = " Telescope live grep" })
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = " Telescope oldfiles"} )
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = " Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = " Telescope help tags" })
      vim.keymap.set("n", "<leader>fi", builtin.symbols, { desc = " Telescope icon picker"})

    end
}
