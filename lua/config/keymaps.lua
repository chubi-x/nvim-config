-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<S-Down>", "10j", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Up>", "10k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-Down>", "yyp", { noremap = true, silent = true })
vim.keymap.set("", "<Leader>xd", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

vim.keymap.set("", "<Leader>gb", "<cmd>BlameToggle window<CR>", { desc = "Toggle git blame" })

vim.keymap.set("", "<Leader>rd", "<cmd>PythonCopyReferenceDotted <CR>", { desc = "Copy Python Reference" })
vim.keymap.set(
  { "n", "v" },
  "<Leader>ac",
  "<cmd>CodeCompanionActions<cr>",
  { noremap = true, silent = true, desc = "Open CodeCompanionActions" }
)
-- vim.keymap.set({ "n", "v" }, "<Leader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
-- vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
