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
          { filetype = "NvimTree", text = "Files", text_align = "left", separator = true, highlight = "NvimTreeNormal" },
        },
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = { "", "" },
        style_preset = "minimal"
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "vesper",
        callback = function()
          vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "BufferLineBackground", { fg = "#585b70", bg = "NONE" })
          vim.api.nvim_set_hl(0, "BufferLineTabLineFill", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bold = false, fg = "#89dceb", bg = "NONE" })
          vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { fg = "#89dceb", bg = "NONE" })
        end,
      })
      -- also apply immediately in case colorscheme already loaded
      vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
    end,
  },
}
