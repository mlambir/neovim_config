local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    t = {
      name = "+terminal",
      t = { ":FloatermToggle<CR>", "New"},
    },
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      b = { '<CMD>FloatermNew --autoclose=2 --height=0.6 --width=0.6 nnn -Hdeo<CR>', 'nnn'},
      t = { '<CMD>FloatermNew --autoclose=2 broot<CR>', 'broot'},
    },
    h = {
      name = "+help",
      t = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
    },
    g = {
      name = "+git",
      g = { "<cmd>FloatermNew gitui<cr>", "gitui" },
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
    w = { ":update<cr>", "Save",},
  },
})

local map = vim.api.nvim_set_keymap

opts = {silent=true, noremap=true}

map('n', 'Y', 'y$', opts)
map('n', 'L', '$', opts)
map('n', 'H', '^', opts)
map('n', 'Q', '<nop>', opts)
map('n', '<leader>no', ':nohl<cr>', opts)

map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)

map('t', '<C-l>', '<C-\\><C-n><C-w>l', opts)
map('t', '<C-k>', '<C-\\><C-n><C-w>k', opts)
map('t', '<C-h>', '<C-\\><C-n><C-w>h', opts)
map('t', '<C-j>', '<C-\\><C-n><C-w>j', opts)
map('t', '<C-t>', '<C-\\><C-n>:FloatermToggle<cr>', opts)
map('t', '<C-a>', '<C-\\><C-n>:FloatermNew<cr>', opts)
map('t', '<C-n>', '<C-\\><C-n>:FloatermNext<cr>', opts)
map('t', '<C-p>', '<C-\\><C-n>:FloatermPrev<cr>', opts)

map('n', "<C-Up>", ":resize -2<CR>", opts)
map('n', "<C-Down>", ":resize +2<CR>", opts)
map('n', "<C-Left>", ":vertical resize -2<CR>", opts)
map('n', "<C-Right>", ":vertical resize +2<CR>", opts)

map('n', "<S-l>", ":BufferNext<CR>", opts)
map('n', "<S-h>", ":BufferPrevious<CR>", opts)
map('n', "<A-j>", ":m .+1<CR>==", opts)
map('n', "<A-k>", ":m .-2<CR>==", opts)

