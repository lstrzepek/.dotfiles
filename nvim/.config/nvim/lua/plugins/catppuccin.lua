return {
 "catppuccin/nvim",
 name = "catppuccin",
 priority = 1000,
 config = function(_,opts)
   require("catppuccin").setup(opts)
   vim.cmd([[colorscheme catppuccin]])
 end,
 opts = function()
   return {
     flavour = "frappe",
     transparent_background = true
   }
 end,
}
