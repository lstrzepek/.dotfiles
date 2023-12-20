return {
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
    -- Example config in lua
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = true
    vim.g.nord_italic = false
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = false

    -- Load the colorscheme
    require('nord').set()
      vim.cmd.colorscheme("nord")
    end,
}-- return {
--  "catppuccin/nvim",
--  name = "catppuccin",
--  priority = 1000,
--  config = function(_,opts)
--    require("catppuccin").setup(opts)
--    vim.cmd([[colorscheme catppuccin]])
--  end,
--  opts = function()
--    return {
--      flavour = "frappe",
--      transparent_background = true
--    }
--  end,
-- }
