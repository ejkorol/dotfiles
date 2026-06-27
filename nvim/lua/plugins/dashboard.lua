return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      local function read_ascii(filepath)
        local lines = {}
        for line in io.lines(filepath) do
          table.insert(lines, (line:gsub("\r", "")))
        end
        return lines
      end


      dashboard.section.header.val = read_ascii(vim.fn.stdpath("config") .. "/assets/eyes.txt")

      dashboard.section.footer.val = read_ascii(vim.fn.stdpath("config") .. "/assets/proverb-3.txt")

      -- styling
      dashboard.section.header.opts.hl = "Comment"
      dashboard.section.footer.opts.hl = "Keyword"

      -- custom layout: vertical padding calculated at draw time so it sits
      -- in the middle of the window regardless of screen height.
      local header_height = #dashboard.section.header.val
      local footer_height = 1
      local total_content = header_height + footer_height + 2 -- +2 for spacing between

      dashboard.opts.layout = {
        {
          type = "padding",
          val = function()
            return math.max(2, math.floor((vim.fn.winheight(0) - total_content) / 2))
          end
        },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.footer,
      }

      -- prevent the statusline / cursor from polluting the vibe
      dashboard.opts.opts.noautocmd = true

      alpha.setup(dashboard.opts)
    end,
  },
}
