-- -- Autocmds are automatically loaded on the VeryLazy event
-- -- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- -- Add any additional autocmds here
--
-- -- Enable session loading on startup
-- vim.api.nvim_create_autocmd("VimEnter", {
--   pattern = "*",
--   callback = function()
--     local session_file = vim.fn.getcwd() .. "/session.vim"
--     if vim.fn.filereadable(session_file) then
--       vim.cmd("source " .. session_file)
--     end
--   end,
-- })
--
-- -- Save session on exit
-- vim.api.nvim_create_autocmd("VimLeavePre", {
--   pattern = "*",
--   callback = function()
--     local session_file = vim.fn.getcwd() .. "/session.vim"
--     if vim.fn.filereadable(session_file) then
--       vim.cmd("mksession! " .. session_file)
--     end
--   end,
-- })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "rust", "python" },
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
  end,
})

-- Enable filetype plugin and indent
vim.cmd("filetype plugin indent on")

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Treesitter configuration
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
