return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-mini/mini.nvim' },
  config = function()
    require('mini.icons').setup()
    require('oil').setup {
      float = {
        border = 'rounded',
        title = ' Oil ',
        title_pos = 'center',
      },
      view_options = {
        show_hidden = false,
        is_hidden_file = function(name, bufnr) return vim.startswith(name, '.') end,
        is_always_hidden = function(name, bufnr) return false end,
        natural_order = false,
        sort = {
          { 'type', 'asc' },
          { 'name', 'asc' },
        },
      },
      keymaps = {
        ['<leader>th'] = {
          callback = function() require('oil').toggle_hidden() end,
          desc = 'Toggle hidden files',
          mode = 'n',
        },
        ["<Space>"] = { "actions.select", desc = "Open file or directory" },
        ["<S-CR>"] = {
          callback = function()
          -- Get the file entry under the cursor
          local entry = require("oil").get_cursor_entry()
          if not entry or entry.type ~= "file" then
            print("Not a valid file")
            return
          end

          -- Build the absolute path to the file
          local dir = require("oil").get_current_dir()
          local file_path = dir .. entry.name

          -- Create an unlisted buffer for the file
          local bufnr = vim.fn.bufadd(file_path)
          vim.fn.bufload(bufnr)

          -- Define the dimensions for your floating window
          local width = math.floor(vim.o.columns * 0.8)
          local height = math.floor(vim.o.lines * 0.8)
          local row = math.floor((vim.o.lines - height) / 2)
          local col = math.floor((vim.o.columns - width) / 2)

          -- Open the file buffer inside the floating window
          vim.api.nvim_open_win(bufnr, true, {
            relative = "editor",
            width = width,
            height = height,
            row = row,
            col = col,
            style = "minimal",
            border = "rounded",
          })
        end,
          desc = "Open file in floating buffer",
        },
        ["cp"] = { 'actions.copy_entry_path', desc = "Copy file path" },
        ["<CR>"] = false,
      },
    }
  end,
}
