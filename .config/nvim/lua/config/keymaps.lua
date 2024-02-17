-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = false }

-- exapnd, contract
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- new Tab
-- keymap.set("n", "te", ":tabedit")
-- keymap.set("n", "<tab>", ":tabnext<Return>", opts)
-- keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- buffer tab change
keymap.set("n", "<tab>", ":BufferLineCycleNext<Return>", opts)
keymap.set("n", "<S-tab>", ":BufferLineCyclePrev<Return>", opts)
keymap.set("n", "q", ":bdelete<Return>", opts)

-- split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- move window
keymap.set("n", "sh", "<C-w>h") -- left
keymap.set("n", "sk", "<C-w>k") -- up
keymap.set("n", "sj", "<C-w>j") -- down
keymap.set("n", "sl", "<C-w>l") -- right

-- select All
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)
