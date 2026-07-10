return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    keys = {
      { "<leader>e", "<cmd>Neotree toggle current reveal_force_cwd left<cr>" },
    },
    opts = {
      enable_git_status = true,
      open_files_do_not_replace_window = true,
      window = {
        position = "left",
        width = 40,
        mappings = {
          ["<tab>"] = "next_source",
          ["<S-tab>"] = "prev_source"
        },
      },
      filesystem = {
        filtered_items = {
          visible = true
        }
      },
      sources = {
        "filesystem",
        "buffers",
        "git_status"
      },
      source_selector = {
        winbar = true,
        statusline = false,
        show_scrolled_off_parent_node = false
      },
      renderers = {
        file = {
          { "indent" },
          { "icon" },
          { "name",       use_git_status_colors = true },
          -- { "diagnostics" },
          { "git_status", highlight = "NeoTreeDimText" },
          -- { "file_size" },
          -- { "last_modified" },
          -- { "created" },
          -- { "symlink_target", zindex = 10 },
        },
      },
    },
  },
  {
    "Crysthamus/nvim-file-operations",
    -- branch = "compat" -- if you are on Neovim <= 0.10
    dependencies = {
      "nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
    },
    config = function()
      require("nvim-file-operations").setup()
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
  },
}
