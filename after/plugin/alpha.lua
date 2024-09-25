local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'
local telescope_builtin = require('telescope.builtin')

-- Replace the header with your custom ASCII art
dashboard.section.header.val = {
    "                                                                                          ",
    "                                                                                          ",
    "                                                                                          ",
    "                                                                                          ",
    "                                                                                          ",
    "                                                                                          ",
    "                                                                                          ",
    "                                                                                          ",
    "                                                                                          ",
    "                                                                                          ",
    "                                                                                          ",
    "                                                                                          ",
    "                                                                                          ",
    "                                                      .::.                                ",
    "                                       .::::-----::..:-=++=          .                    ",
    "                                   :-====++++++++++++==+++++..   .-===+                   ",
    "                                .-=++++++*********+++=++++=+==++----==*                   ",
    "                             .:=++++++++*######*****+=++++++==++==-==++                   ",
    "                      .:::::==+++++++++++************+**********+--==+:                   ",
    "                     .===========++++++++++++++++++++=====+*****+*++++:                   ",
    "                    -===========++++++++++++++++++++======+*++++==*+++=-.                 ",
    "                   -======++**+++=====+++++++++++********+*#*==+===*++===.                ",
    "                   -===+*#%%@@@%#*+====+++++++*#%%%%%##**###*+*##*+**+===:                ",
    "                   ===*%@@%##@@@@%*++++++++++*%@@@@@@@@%#############*+==:                ",
    "                  -==*@@@@#*#@@@@%#++++++++**##*#@@@@@@@@%#####**####**+=.                ",
    "                  ===*%@@@@@@@@%#**++++++++**##%@@@@@@@@@%#####**+****++=                 ",
    "                  ===++#@@@@@@%##**+++*********#%@@@@@@@%######*+++++++=-                 ",
    "                  -===++*******+******************############*++++++++=-                 ",
    "                  =====++++++++******#######**********########*+++==++++=                 ",
    "                 .=====+++++++++*****#######**********######***++===+++-.                 ",
    "                 :=======+++++++++++***#####**+++******#####****+===+-.                   ",
    "                 .=================++*+******++++++***#####****++===:                     ",
    "                  -==========-----==+**+**##*+++++****##******+++=+-                      ",
    "                   :-=====--------===++***#****++++**********+++++-                       ",
    "                     :------------====+++++++++++++++++++++++++++.                        ",
    "                       .:----------==================++++++++++-                          ",
    "                          .:--==========================++++++:                           ",
    "                              .-=+++=---------=---=+++++++++*-                            ",
    "                                                    -+*++++*-                             ",
    "                                                      ..:..                               ",
    "                                                                                          ",
    "                                                                                          ",
    "                                                                                          ",
    "                                                                                          ",
}
-- List recent projects from project.nvim
dashboard.section.projects = {
  type = "group",
  val = {
    { type = "text", val = "Recent Projects", opts = { hl = "SpecialComment", position = "center" } },
    { type = "padding", val = 1 },
    -- Show recent projects
    {
      type = "text",
      val = function()
        local recent_projects = {}
        for _, project in ipairs(require('project_nvim').get_recent_projects()) do
          table.insert(recent_projects, {
            type = "button",
            val = project,
            on_press = function()
              vim.cmd("cd " .. project)
              vim.cmd("Telescope find_files")
            end,
            opts = { position = "center", shortcut = "SPC p f", cursor = 5, width = 30 },
          })
        end
        return recent_projects
      end,
    },
  },
  opts = {
    position = "center",
  },
}

-- Customize buttons for adding/removing projects
dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", "  Find project", ":Telescope projects<CR>"),
  dashboard.button("a", "  Add project", ":lua require('project_nvim.project').add_project()<CR>"),
  dashboard.button("r", "  Remove project", ":lua require('project_nvim.project').remove_project()<CR>"),
  dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}

alpha.setup(dashboard.opts)

require('project_nvim').setup({
  manual_mode = false, -- Automatically detect your project root
  detection_methods = { "pattern", "lsp" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
  show_hidden = false, -- Don't show hidden files in project list
  })
