return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.loop.new_timer():start(0, 1000, vim.schedule_wrap(function()
        vim.cmd("redrawstatus")
      end))

      require("lualine").setup {
        options = {
          theme = "auto",
          globalstatus = true,
          component_separators = "",
          section_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { { "branch", icon = "" }, "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = {
            function()
              return os.date('%H:%M:%S')
            end,
            "location",
          },
        },
      }
    end,
  }
}
