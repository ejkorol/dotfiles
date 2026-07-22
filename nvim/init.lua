vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.keymap.set('n', '<C-w>v', '<C-w>v<C-w>l')

-- quick split
vim.keymap.set('n', '<leader>v', '<cmd>vsplit<CR><C-w>l')

-- go back from 'gd'
vim.keymap.set('n', 'gb', '<C-o>')

-- dictionary
vim.keymap.set("n", "<leader>sn", "]s", { desc = "Next misspelled word" })
vim.keymap.set("n", "<leader>sp", "[s", { desc = "Previous misspelled word" })
vim.keymap.set("n", "<leader>sf", "z=", { desc = "Spell suggestions" })
vim.keymap.set("n", "<leader>sa", "zg", { desc = "Add word to dictionary" })
vim.keymap.set("n", "<leader>sr", "zug", { desc = "Undo add word" })

vim.opt.wrap = false
vim.opt.fillchars = { eob = " " }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes"
vim.opt.winborder = "single"
vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.opt.fillchars:append({ vert = " " })

require("lazy").setup("plugins")
