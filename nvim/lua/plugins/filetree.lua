return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "<leader>e",
        function()
          local api = require("nvim-tree.api")
          if api.tree.is_visible() then
            api.tree.close()
          else
            api.tree.expand_all()
            api.tree.focus()
          end
        end,
        desc = "Toggle file tree",
      },
    },
    init = function()
      -- disable netrw (nvim's built-in, clashes with nvim-tree)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    opts = {
      update_focused_file = {
        enable = true
      },
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
