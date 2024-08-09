return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    spec = {
      --      {
      --        mode = { 'n', 'v' },
      { '<leader>f', group = 'find' },
      { '<leader>c', group = 'code' },
      { '<leader>g', group = 'git' },
      { '<leader>b', group = 'buffers' },
      { "[",         group = "prev" },
      { "]",         group = "next" },
    }
    --    }
    --    -- your configuration comes here
    --    -- or leave it empty to use the default settings
    --    -- refer to the configuration section below
  },
}
