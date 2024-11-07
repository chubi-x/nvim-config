-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<S-Down>", "10j", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Up>", "10k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-Down>", "yyp", { noremap = true, silent = true })
vim.keymap.set("", "<Leader>xd", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

vim.keymap.set("", "<Leader>gb", "<cmd>BlameToggle window<CR>", { desc = "Toggle git blame" })
