-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = false,
      hide_gitignored = true,
      vim.diagnostic.config({ virtual_text = false }),
    },
  },
})

require("neo-tree.sources.filesystem.commands")
  -- Call the refresh function found here: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/2f2d08894bbc679d4d181604c16bb7079f646384/lua/neo-tree/sources/filesystem/commands.lua#L11-L13
  .refresh(
    -- Pull in the manager module. Found here: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/2f2d08894bbc679d4d181604c16bb7079f646384/lua/neo-tree/sources/manager.lua
    require("neo-tree.sources.manager")
      -- Fetch the state of the "filesystem" source, feeding it to the filesystem refresh call since most everything in neo-tree
      -- expects to get its state fed to it
      .get_state("filesystem")
  )
