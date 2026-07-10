return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<S-l>",      "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<leader>bp", "<cmd>BufferLinePick<cr>",      desc = "Pick buffer" },
    },
    opts = {
      highlights = {
        fill = {
          bg = "NONE",
        },
        background = {
          fg = "#585b70",
          bg = "NONE",
        },
        buffer_selected = {
          bold = true,
          italic = false,
          fg = "#89dceb",
          bg = "NONE",
        },
        indicator_selected = {
          fg = "#89dceb",
          bg = "NONE",
        },
      },
      options = {
        offsets = {
          { filetype = "neo-tree", text = "Explorer", text_align = "center", separator = true, highlight = "directory" },
        },
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = { "", "" },
        style_preset = "minimal"
      },
    },
  },
}
