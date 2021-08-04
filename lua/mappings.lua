local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      n = { "<cmd>enew<cr>", "New File" },
    },
    h = {
      name = "+help",
      t = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
    },
    g = {
      name = "+git",
      g = { "<cmd>lua _gitui_toggle()<cr>", "gitui" },
      l = { "<cmd>Telescope git_commits<cr>", "Git Commits" },
      L = { "<cmd>Telescope git_bcommits<cr>", "Git Buffer Commits" },
      b = { "<cmd>Telescope git_branches<cr>", "Git Branches" },
      s = { "<cmd>Telescope git_status<cr>", "Git Status" },
    },
    r = {
      name = "+run",
      r = { "<cmd>lua require('telescope').extensions.asynctasks.all()<cr>", "Run Tasks",},
    },
    b = {
      name = "+buffer",
      b = { "<cmd>Telescope buffers<cr>", "List Buffers",},
    },
    ["/"] = { "<cmd>Telescope live_grep<cr>", "Live Grep",},
    ["*"] = { "<cmd>Telescope grep_string<cr>", "Grep String",},
    w = { ":w<cr>", "Save",},
  },
})

opts = {silent=true, noremap=true}
local map = vim.api.nvim_set_keymap

vim.api.nvim_set_keymap('n', 'Y', 'y$', opts)
vim.api.nvim_set_keymap('n', '<leader>no', ':nohl<cr>', opts)
