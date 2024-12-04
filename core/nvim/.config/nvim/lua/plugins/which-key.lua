return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		spec = {
			{ "<leader>a", group = "AI" },
			{ "<leader>b", group = "Buffer" },
			{ "<leader>c", group = "Code", mode = { "n", "x" } },
			{ "<leader>d", group = "Document" },
			{ "<leader>r", group = "Rename" },
			{ "<leader>s", group = "Search" },
			{ "<leader>w", group = "Workspace" },
			{ "<leader>t", group = "Toggle" },
			{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
			{ "<leader>e", "<cmd>Lexplore<cr>", desc = "Toggle Explore", mode = "n" },
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
