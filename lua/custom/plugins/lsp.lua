-- Define the configuration for the dbt language server
vim.lsp.config('dbt', {
  -- The command to start the server
  -- Ensure 'dbt-language-server' is in your system $PATH
  cmd = { "dbt-language-server" },
  
  -- The filetypes this server should attach to
  filetypes = { "sql", "yaml" },
  
  -- How to find the project root (replaces util.root_pattern)
  root_markers = { "dbt_project.yml" },
  
  -- General settings (standard for most servers)
  settings = {},
})

-- Tell Neovim to actually use/enable this server
vim.lsp.enable('dbt')
