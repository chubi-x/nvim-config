return {

  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "leoluz/nvim-dap-go",
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")
    local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")

    require("mason-nvim-dap").setup()
    require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
    require("dap-go").setup()
    require("nvim-dap-virtual-text").setup({})
    dapui.setup()
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    dap.configurations.python = {
      {
        type = "python",
        request = "attach",
        connect = {
          port = 6700,
          host = "0.0.0.0",
        },
        mode = "remote",
        name = "debug python",
        pathMappings = { {
          localRoot = vim.fn.getcwd(),
          remoteRoot = "/app",
        } },
      },
    }

    vim.keymap.set("n", "<leader>dc", function()
      dap.continue()
    end, { desc = "continue debugger" })

    vim.keymap.set("n", "<leader>du", function()
      require("dapui").toggle({ reset = true })
    end, { desc = "Toggle UI" })

    vim.keymap.set("n", "<Leader>dso", function()
      dap.step_over()
    end, { desc = "Step over" })
    vim.keymap.set("n", "<Leader>dsi", function()
      dap.step_into()
    end, { desc = "Step in" })
    vim.keymap.set("n", "<Leader>dso", function()
      dap.step_out()
    end, { desc = "Step out" })

    vim.keymap.set("n", "<Leader>db", function()
      dap.toggle_breakpoint()
    end, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<Leader>B", function()
      dap.set_breakpoint()
    end, { desc = "Set breakpoint" })
    vim.keymap.set("n", "<Leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, { desc = "Log point message" })
    -- vim.keymap.set("n", "<Leader>dr", function()
    --   dap.repl.open()
    -- end, { desc = "Open REPL" })
    vim.keymap.set("n", "<Leader>dl", function()
      dap.run_last()
    end, { desc = "Run last" })
    vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
      require("dap.ui.widgets").hover()
    end, { desc = "Hover" })
    vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
      require("dap.ui.widgets").preview()
    end, { desc = "Preview" })
    vim.keymap.set("n", "<Leader>df", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.frames)
    end, { desc = "Open Frames" })
    vim.keymap.set("n", "<Leader>ds", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.scopes)
    end, { desc = "Open Scopes" })
  end,
}
