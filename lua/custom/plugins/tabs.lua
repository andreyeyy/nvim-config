vim.pack.add {
  'https://github.com/akinsho/bufferline.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
}

require('bufferline').setup {
  options = {
    mode = 'buffers',
    diagnostics = 'nvim_lsp',
    separator_style = 'slant',
    show_buffer_close_icons = true,
    show_close_icon = false,
    always_show_bufferline = true,

    -- push the bufferline to start after neo-tree
    offsets = {
      {
        filetype = 'neo-tree',
        text = 'File Explorer',
        text_align = 'center',
        separator = true,
      },
    },

    -- customize how terminal buffers show up
    custom_filter = function(buf_number)
      -- hide terminal buffers from the bufferline entirely
      local ft = vim.bo[buf_number].filetype
      if ft == 'toggleterm' or vim.bo[buf_number].buftype == 'terminal' then
        return false
      end
      return true
    end,
  },
}

vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { desc = 'Prev buffer' })
