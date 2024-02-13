return {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = function()
				require("github-theme").setup({
					options = {
						transparent = true,
						-- styles = {
						-- 	sidebars = transparent,
						-- 	floats = transparent,
						-- },
					},
				})
				vim.cmd("colorscheme github_dark_default")
			end,
		},
	},
}
