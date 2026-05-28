return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-mini/mini.nvim' },
  config = function()
    require('mini.icons').setup()
    require('oil').setup()
  end,
}
