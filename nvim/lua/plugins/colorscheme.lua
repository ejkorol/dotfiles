return {
  {
    "datsfilipe/vesper.nvim",
    lazy = false,    -- load at startup, not on demand
    priority = 1000, -- load before other plugins so colors apply cleanly
    config = function()
      vim.cmd.colorscheme("vesper")
    end,
  },
}
