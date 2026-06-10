return {
  {
    "brenoprata10/nvim-highlight-colors",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      render = "virtual", -- "background" | "foreground" | "virtual"
      enable_named_colors = true,
      enable_tailwind = true,
    },
  },
}
