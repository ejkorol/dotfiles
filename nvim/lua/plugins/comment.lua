return {
  {
    "numToStr/Comment.nvim",
    keys = {
      {
        "<leader>/",
        function() require("Comment.api").toggle.linewise.current() end,
        mode = "n",
        desc = "Toggle comment",
      },
      {
        "<leader>/",
        "<Plug>(comment_toggle_linewise_visual)",
        mode = "x",
        desc = "Toggle comment (visual)",
      },
    },
    opts = {},
  },
}
