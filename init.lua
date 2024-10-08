-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.keymap.set("n", "<C-Down>", "10j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Up>", "10k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "10h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "10l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Shift-Down>", "yyp", { noremap = true, silent = true })
