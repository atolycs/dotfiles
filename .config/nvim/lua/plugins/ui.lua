return {

	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	event = "VeryLazy",
	-- 	keys = {
	-- 		{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Tab" },
	-- 		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev Tab" },
	-- 	},
	-- 	opts = {
	-- 		options = {
	-- 			mode = "tabs",
	-- 			show_buffer_close_icons = false,
	-- 			show_close_icon = false,
	-- 		},
	-- 	},
	-- },

	{
		"projekt0n/github-nvim-theme",
	},
	{
		"nvimdev/dashboard-nvim",
		opts = function(_, opts)
			opts.config.center = {
				{ action = "ene ", desc = "New File", icon = " ", key = "n" },
				{
					action = "Telescope file_browser hidden=true initial_mode=normal",
					desc = "Open File",
					icon = " ",
					key = "o",
				},
				{
					action = [[lua require("lazyvim.util").telescope.config_files()()]],
					desc = "Config",
					icon = "󰖷 ",
					key = "c",
				},
				{ action = "Lazy", desc = "Lazy plugin manager", icon = "󰒲 ", key = "l" },
				{ action = "Mason", desc = "Mason LSP Manager", icon = " ", key = "m" },
				{ action = "checkhealth", desc = "Check NeoVim Health", icon = " ", key = "h" },
				{ action = "bdelete", desc = "Back to Editor", icon = "󱇨 ", key = "b" },
				{ action = "qa", desc = "Quit", icon = "󰩈 ", key = "q" },
			}
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "DashboardLoaded",
					callback = function()
						require("lazy").show()
					end,
				})
			end
		end,
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 3000,
			background_colour = "#000000",
		},
	},
}
