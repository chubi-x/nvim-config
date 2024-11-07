return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          ".git",
        },
        never_show = {},
      },
    },
  },
}
