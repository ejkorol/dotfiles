return {
  {
    "datsfilipe/vesper.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vesper").setup({
        transparent = true,
        italics = {
          comments = true,
          keywords = false,
          functions = false,
          variables = false,
        },
      })
      vim.cmd.colorscheme("vesper")

      -- winbar
      vim.api.nvim_set_hl(0, "WinBar", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "WinBarNC", { bg = "NONE" })

      -- neotree
      vim.api.nvim_set_hl(0, "NeoTreeTabActive", { fg = "#e0e0e0", bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeTabInactive", { fg = "#3c3c3c", bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorActive", { fg = "NONE", bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", { fg = "NONE", bg = "NONE" })

      -- bufferline
      vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "BufferLineBackground", { fg = "NONE", bg = "NONE" })
      vim.api.nvim_set_hl(0, "BufferLineTabLineFill", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bold = false, fg = "#89dceb", bg = "NONE" })
      vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { fg = "#89dceb", bg = "NONE" })
      vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })

      -- blankline
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#1e1e1e" })
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#F97316" })

      -- floats
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#303030", bg = "none" })
    end,
  },
}
