return {
  {
    "https://gitea.gwairfelin.com/max/openingh.nvim",
    keys = {
      {
        "<leader>gB",
        "<cmd>OpenInGHFile!<cr>",
        desc = "Open this file in the git remote",
      },
      {
        "<leader>gB",
        "<cmd>'<,'>OpenInGHFileLines!<cr>",
        desc = "Open these lines in the git remote",
        mode = "v",
      },
    },
  },
}
