return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree" },
    },
    init = function()
      -- disable netrw (nvim's built-in, clashes with nvim-tree)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    opts = {
      renderer = {
        root_folder_label = ":t",
        indent_markers = { enable = true }
      },
      view = {
        width = 35
      }
    },
  },
}
