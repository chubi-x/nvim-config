return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    version = false, -- so it tracks main branch
    build = ":TSUpdate",
    -- lazy loading or events, as appropriate
    opts = {
      ensure_installed = { "htmldjango", "lua", "python", "bash", "vim" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      folding = {
        enable = true,
      },
    },
  },
}
