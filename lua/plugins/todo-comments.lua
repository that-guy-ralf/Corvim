return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  config = function ()
    require("todo-comments").setup()
  end
}
-- Below are the options. Simply write a comment followed by a colon symbol (:) and it will highlight.
-- TODO:
-- NOTE:
-- FIX:
-- BUG:
-- HACK:
-- PERF:
-- WARNING:
