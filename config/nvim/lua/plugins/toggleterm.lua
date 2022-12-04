-- Toggleterm configuration file
local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 18,
	shade_terminals = false,
	open_mapping = "<leader>t",
	direction = "horizontal",
	persist_size = true,
})

local term_buf_map = function(lhs, rhs)
	require("core.utils").buf_map("t", lhs, rhs)
end

-- set keymap
vim.api.nvim_create_autocmd("TermOpen", {

	pattern = "term://*",
	callback = function()
		term_buf_map("<esc>", [[<C-\><C-n>]])
		term_buf_map("<C-h>", [[<Cmd>wincmd h<CR>]])
		term_buf_map("<C-j>", [[<Cmd>wincmd j<CR>]])
		term_buf_map("<C-k>", [[<Cmd>wincmd k<CR>]])
		term_buf_map("<C-l>", [[<Cmd>wincmd l<CR>]])
	end,
})
