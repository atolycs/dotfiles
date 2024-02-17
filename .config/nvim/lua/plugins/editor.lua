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

          telescope.extensions.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            hidden = true,
            initial_mode = "normal"
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      }
    },

    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extentions.file_browser.actions

      opts.extentions = {
        file_browser = {
          hijack_netrw = true,
          mappings = {
            -- insert mode mapping
            ["n"] = {
              ["N"] = fb_actions.create,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
            }
          }
        }
      }
      telescope.setup(opts)
      require("telescope").load_extensions("file_browser")
    end,
  }
}
