-- Ensure nvim-dap is loaded first
local dap = require('dap')
local dapui = require("dapui")

-- Automatically open and close DAP UI when debugging starts/stops
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dapui.setup({
  -- Customize how the DAP UI looks
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  layouts = {
    {
      elements = {
        -- Elements to include in the sidebar
        { id = "scopes", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 40, -- Sidebar width
      position = "left", -- Sidebar position
    },
    {
      elements = {
        "repl", -- DAP REPL at the bottom
      },
      size = 10, -- Height of the bottom panel
      position = "bottom", -- Bottom position
    },
  },
})

