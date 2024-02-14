return {
	{
		"projekt0n/github-nvim-theme",
	},
	{
		"nvimdev/dashboard-nvim",
		opts = function(_, opts)
			opts.config.center = {
				{ action = "ene | startinsert", desc = "New File", icon = " ", key = "n" },
				{
					action = [[lua require("lazyvim.util").telescope.config_files()()]],
					desc = "Config",
					icon = "󰖷 ",
					key = "c",
				},
				{ action = "Lazy", desc = "Lazy plugin manager", icon = "󰒲 ", key = "l" },
				{ action = "qa", desc = "Quit", icon = " ", key = "q" },
			}
		end,
	},
}
