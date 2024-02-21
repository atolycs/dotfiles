return {
	{
		"telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim",
		},
		keys = {
			{
				"sf",
				function()
					local telescope = require("telescope")

					local function telescope_buffer_dir()
						return vim.fn.expand("%:p:h")
					end

					telescope.extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = telescope_buffer_dir(),
						hidden = true,
						initial_mode = "normal",
						layout_config = { height = 40 },
					})
				end,
				desc = "Open File Browser with the path of the current buffer",
			},
		},

		config = function(_, opts)
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions

			opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				wrap_results = true,
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					n = {},
				},
			})

			opts.pickers = {
				diagnostics = {
					initial_mode = "normal",
				},
			}

			opts.extensions = {
				file_browser = {
					hijack_netrw = true,
					mappings = {
						-- insert mode mapping
						["n"] = {
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							--[""]
							["/"] = function()
								vim.cmd("startinsert")
							end,
							["<C-u>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-d>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
						},
					},
				},
			}
			telescope.setup(opts)
			require("telescope").load_extension("file_browser")
		end,
	},
}
