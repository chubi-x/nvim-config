return {
  "ErichDonGubler/lsp_lines.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("lsp_lines").setup()
  end,
  event = "LspAttach",
}
