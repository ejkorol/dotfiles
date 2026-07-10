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
        show_scrolled_off_parent_node = false,
        content_layout = "center",
        tabs_min_width = nil,
        tabs_max_width = nil,
        padding = 0,
        separator = { left = "", right = "" },
        separator_active = nil,
        show_separator_on_edge = false,
        highlight_tab = "NeoTreeTabInactive",
        highlight_tab_active = "NeoTreeTabActive",
        highlight_background = "NeoTreeTabInactive",
        highlight_separator = "NeoTreeTabSeparatorInactive",
        highlight_separator_active = "NeoTreeTabSeparatorActive",
      },
      renderers = {
        file = {
          { "indent" },
          { "icon" },
          { "name",       use_git_status_colors = true },
          { "git_status", highlight = "NeoTreeDimText" },
        },
      },
    },
  },
  {
    "Crysthamus/nvim-file-operations",
    dependencies = {
      "nvim-neo-tree/neo-tree.nvim",
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
          bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
  },
}
