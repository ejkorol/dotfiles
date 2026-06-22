return {
  { "williamboman/mason.nvim", opts = {} },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "lua_ls", "ts_ls", "oxlint", "oxfmt", "tailwindcss" },
      automatic_enable = true, -- auto vim.lsp.enable() for installed servers
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Apply nvim-cmp capabilities to every LSP config
      vim.lsp.config("*", { capabilities = capabilities })

      -- oxlint
      vim.lsp.enable('oxlint')

      -- Per-server tweaks. lua_ls needs to know `vim` is a global or it'll yell.
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      -- Float window styling for hover / signature help.
      -- Wrapped in a function + autocmd so the colorscheme can't clobber it.
      local function set_float_hl()
        -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
        -- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#666666", bg = "#000000" })
      end
      set_float_hl()
      vim.api.nvim_create_autocmd("ColorScheme", { callback = set_float_hl })

      -- Keymaps fire when an LSP attaches to a buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = { buffer = event.buf, silent = true }
          vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover({ border = "rounded" })
          end, opts)
          vim.keymap.set({ "n", "i" }, "<C-k>", function()
            vim.lsp.buf.signature_help({ border = "rounded" })
          end, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        end,
      })
    end,
  },
}
