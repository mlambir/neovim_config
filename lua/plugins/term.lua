require("toggleterm").setup{
  open_mapping = [[<c-t>]],
} 

local Terminal  = require('toggleterm.terminal').Terminal

local gitui = Terminal:new({
  cmd = "gitui",
  dir = "git_dir",
  direction = "float",
  close_on_exit = true,
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
  end,
})

function _gitui_toggle()
  gitui:toggle()
end

