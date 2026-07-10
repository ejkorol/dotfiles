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

      vim.api.nvim_set_hl(0, "WinBar", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "WinBarNC", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeTabActive", { fg = "#e0e0e0", bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeTabInactive", { fg = "#3c3c3c", bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorActive", { fg = "NONE", bg = "NONE" })
      vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", { fg = "NONE", bg = "NONE" })
    end,
  },
}
