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
      options = {
        offsets = {
          { filetype = "NvimTree", text = "Files", text_align = "left", separator = true, highlight = "NvimTreeNormal" },
        },
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "thin",
      },
    },
  },
}
