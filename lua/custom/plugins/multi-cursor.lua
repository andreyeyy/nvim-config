vim.g.VM_maps = {
  ["Find Under"]         = "<C-n>",
  ["Find Subword Under"] = "<C-n>",
  ["Add Cursor Down"]    = "<M-j>",
  ["Add Cursor Up"]      = "<M-k>",
  ["Skip Region"]        = "q",
  ["Remove Region"]      = "Q",
}

vim.pack.add {
  { src = 'https://github.com/mg979/vim-visual-multi', version = 'master' },
}

-- Alt + arrows to add more cursors
vim.keymap.set('n', '<M-Down>', '<Plug>(VM-Add-Cursor-Down)')
vim.keymap.set('n', '<M-Up>',   '<Plug>(VM-Add-Cursor-Up)')
