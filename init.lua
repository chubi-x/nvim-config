-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
--
-- require("neo-tree.sources.filesystem.commands")
--   -- Call the refresh function found here: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/2f2d08894bbc679d4d181604c16bb7079f646384/lua/neo-tree/sources/filesystem/commands.lua#L11-L13
--   .refresh(
--     -- Pull in the manager module. Found here: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/2f2d08894bbc679d4d181604c16bb7079f646384/lua/neo-tree/sources/manager.lua
--     require("neo-tree.sources.manager")
--       -- Fetch the state of the "filesystem" source, feeding it to the filesystem refresh call since most everything in neo-tree
--       -- expects to get its state fed to it
--       .get_state("filesystem")
--   )

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("AutoCwdLibrary", { clear = true }),
  callback = function()
    local filepath = vim.fn.expand("%:p")
    -- Check if the file path contains typical library locations
    if filepath:match("site%-packages") or filepath:match("dist%-packages") then
      -- Change the local window directory (lcd) to the file's directory
      vim.cmd("lcd " .. vim.fn.expand("%:p:h"))
    end
  end,
})
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local null_ls = require("null-ls")
-- vim.lsp.config["null-ls"]
null_ls.setup({
  sources = {},
})
vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

vim.lsp.config("denols", {
  root_markers = { "deno.json", "deno.jsonc" },
})
--
-- require("lspconfig").html.setup({
--   capabilities = capabilities,
--   cmd = { "djlint", "%s --profile=django" },
--   filetypes = { "html", "htmldjango" },
--   settings = {
--     html = {
--       formatOptions = {
--         indentSize = 2,
--         tabSize = 2,
--       },
--     },
--   },
-- })
