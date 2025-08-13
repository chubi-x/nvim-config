-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("neo-tree.sources.filesystem.commands")
  -- Call the refresh function found here: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/2f2d08894bbc679d4d181604c16bb7079f646384/lua/neo-tree/sources/filesystem/commands.lua#L11-L13
  .refresh(
    -- Pull in the manager module. Found here: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/2f2d08894bbc679d4d181604c16bb7079f646384/lua/neo-tree/sources/manager.lua
    require("neo-tree.sources.manager")
      -- Fetch the state of the "filesystem" source, feeding it to the filesystem refresh call since most everything in neo-tree
      -- expects to get its state fed to it
      .get_state("filesystem")
  )
require("mason-lspconfig").setup({ automatic_enable = true })
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local null_ls = require("null-ls")
-- vim.lsp.config["null-ls"]
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.completion.spell,
    null_ls.builtins.diagnostics.djlint,
  },
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
