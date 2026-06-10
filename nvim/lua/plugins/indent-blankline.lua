return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      {
        "<leader>ui",
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          local config = require("ibl.config").get_config(bufnr)
          require("ibl").setup_buffer(bufnr, { enabled = not config.enabled })
        end,
        desc = "Toggle indent guides",
      },
    },
    config = function()
      local set_hl = function()
        vim.api.nvim_set_hl(0, "IblIndent", { fg = "#1e1e1e" })
        vim.api.nvim_set_hl(0, "IblScope", { fg = "#F97316" })
      end

      set_hl()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = set_hl })

      require("ibl").setup({
        indent = {
          char = "┊",
          tab_char = "┊",
          highlight = { "IblIndent" },
        },
        scope = {
          enabled = true,
          show_start = false,
          show_end = false,
          highlight = { "IblScope" },
        },
        exclude = {
          filetypes = {
            "help", "dashboard", "neo-tree", "Trouble", "lazy", "mason",
          },
        },
      })
    end,
    opts = {
      indent = {
        char = "┊", -- "│" ... "▏" ... "┊"
        tab_char = "┊",
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        highlight = { "Function", "Label" },
      },
      exclude = {
        filetypes = {
          "help", "dashboard", "neo-tree", "Trouble", "lazy", "mason",
        },
      },
    },
  },
}
