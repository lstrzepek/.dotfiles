return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    spec = {
        { '<leader>b', group = '[B]uffer' },
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    --spec = {
    --  --      {
    --  --        mode = { 'n', 'v' },
    --  { '<leader>f', group = 'find' },
    --  { '<leader>c', group = 'code' },
    --  { '<leader>e', group = 'explore' },
    --  { '<leader>g', group = 'git' },
    --  { '<leader>b', group = 'buffers' },
    --  { "[",         group = "prev" },
    --  { "]",         group = "next" },
    --}
    --    }
    --    -- your configuration comes here
    --    -- or leave it empty to use the default settings
    --    -- refer to the configuration section below
  },
}
