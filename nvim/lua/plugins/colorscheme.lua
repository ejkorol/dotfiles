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
    end,
  },
}
