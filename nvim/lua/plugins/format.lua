return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function() require("conform").format({ async = true, lsp_format = "fallback" }) end,
        mode = { "n", "v" },
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        javascript     = { "oxfmt" },
        javascriptreact = { "oxfmt" },
        typescript     = { "oxfmt" },
        typescriptreact = { "oxfmt" },
        json           = { "oxfmt" },
        lua            = { "stylua" },
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
      },
      formatters = {
        -- oxfmt isn't built-in to conform yet, so define it explicitly
        oxfmt = {
          command = "oxfmt",
          args = { "--stdin-filepath", "$FILENAME" },
          stdin = true,
        },
      },
    },
  },
}
