-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-Down>", "10j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Up>", "10k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "10h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "10l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-Down>", "yyp", { noremap = true, silent = true })
