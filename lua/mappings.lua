local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
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
    ["/"] = { "<cmd>Telescope live_grep<cr>", "Live Grep",},
    ["*"] = { "<cmd>Telescope grep_string<cr>", "Grep String",},
    bb = { "<cmd>Telescope buffers<cr>", "Buffers",},
    rr = { "<cmd>lua require('telescope').extensions.asynctasks.all()<cr>", "Run Tasks",},
  },
})

local map = vim.api.nvim_set_keymap

opts = {silent=true, noremap=true}

vim.api.nvim_set_keymap('n', 'Y', 'y$', opts)
vim.api.nvim_set_keymap('n', 'no', ':nohl<cr>', opts)
