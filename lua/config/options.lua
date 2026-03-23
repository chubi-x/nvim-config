-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.number = true
-- vim.opt.relativenumber = false
vim.opt.winbar = "%=%m %f"

vim.opt.clipboard = "unnamedplus"
vim.opt.sessionoptions:append("buffers", "curdir", "help", "winpos", "winsize", "terminal")
-- vim.g.root_spec = { "cwd" }
---- Use nvim-treesitter for folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Start with folds closed
vim.opt.foldenable = false
