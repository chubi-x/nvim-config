return {
  {
    "folke/snacks.nvim",
    opts = {
      gitbrowse = {
        opts = {
          what = "permalink",
        },
        config = function(opts, defaults)
          opts.url_patterns["bitbucket%.org"] = {
            branch = "/src/{branch}",
            file = "/src/{branch}/{file}#lines-{line_start}:{line_end}",
            permalink = "/src/{commit}/{file}#lines-{line_start}:{line_end}",
            commit = "/commits/{commit}",
          }
        end,
      },
    },
  },
}
