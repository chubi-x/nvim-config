return {
  "nvimtools/none-ls.nvim",
  depends = {
    "nvim-lua/plenary.vim",
  },
  opts = {},
  config = function()
    local null_ls = require("null-ls")

    local nginx_formatter = {
      name = "nginx_config_formatter",
      method = null_ls.methods.FORMATTING,
      filetypes = { "nginx", "conf" }, -- adjust per your setup
      generator = require("null-ls.helpers").generator_factory({
        command = "nginxfmt",
        args = { "-i", "4", "$FILENAME" }, -- use correct flag, e.g. `--stdin`
        to_temp_file = true,
        from_temp_file = true,
        on_output = function(params, done)
          done({ { text = params.output } })
        end,
      }),
    }
    null_ls.setup({
      debug = true,
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.completion.tags,
        null_ls.builtins.diagnostics.djlint,
        null_ls.builtins.diagnostics.ansiblelint,
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.diagnostics.fish,
        nginx_formatter,
      },
    })
  end,
}
