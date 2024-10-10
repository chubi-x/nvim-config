return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            analysis = {
              typeCheckingMode = "off",
            },
          },
        },
      },
    },
  },
}
