return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- main branch does not support lazy-loading
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      ts.setup()

      local ensure_installed = {
        "lua", "vim", "vimdoc", "query",
        "javascript", "typescript", "tsx",
        "html", "css", "json", "yaml", "toml",
        "markdown", "markdown_inline",
        "bash", "regex",
      }

      local installed = {}
      for _, lang in ipairs(ts.get_installed("parsers")) do
        installed[lang] = true
      end

      local missing = vim.tbl_filter(function(lang)
        return not installed[lang]
      end, ensure_installed)

      if #missing > 0 then
        ts.install(missing)
      end

      -- On main, Neovim owns highlighting and this plugin only supplies
      -- parsers and queries, so features are enabled per-buffer here.
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          local lang = vim.treesitter.language.get_lang(ev.match)
          if not lang or not pcall(vim.treesitter.start, ev.buf, lang) then
            return
          end
          if vim.treesitter.query.get(lang, "indents") then
            vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
