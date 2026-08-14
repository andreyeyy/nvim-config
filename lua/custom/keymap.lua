local term_win = nil

local function get_largest_win()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  local best_win, best_area = nil, -1

  for _, win in ipairs(wins) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.bo[buf].filetype

    -- skip sidebars / non-editing windows
    if ft ~= 'neo-tree' and ft ~= 'NvimTree' then
      local width = vim.api.nvim_win_get_width(win)
      local height = vim.api.nvim_win_get_height(win)
      local area = width * height
      if area > best_area then
        best_area = area
        best_win = win
      end
    end
  end

  return best_win
end

local function toggle_terminal()
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, false)
    term_win = nil
    return
  end

  local target = get_largest_win()
  if target then
    vim.api.nvim_set_current_win(target)
  end

  vim.cmd 'belowright split'
  vim.cmd('resize ' .. math.floor(vim.o.lines * 0.25))
  vim.cmd 'terminal'
  vim.cmd 'startinsert'
  term_win = vim.api.nvim_get_current_win()
end

vim.keymap.set('n', '<leader>t', toggle_terminal, { desc = 'Toggle [T]erminal (25% height)' })
vim.keymap.set('n', '<C-t>', toggle_terminal, { desc = 'Toggle Terminal' })

vim.keymap.set('t', '<C-t>', function()
  vim.cmd 'stopinsert'
  toggle_terminal()
end, { desc = 'Toggle Terminal' })

-- Space + W = save file
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })

-- Select all text 
vim.keymap.set('n', '<leader>a', 'ggVG', { desc = 'Select all' })
