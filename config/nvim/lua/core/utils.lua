local M = {}

-- @desc function for global keymapping
M.map = function(mode, lhs, rhs, opts)
	local options = { silent = true }

	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- @desc function for buffer keymapping
M.buf_map = function(mode, lhs, rhs, opts)
	local options = { silent = true, buffer = true }

	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- @desc go to website
M.go_to_url = function(cmd)
	local url = vim.fn.expand("<cfile>", nil, nil)
	if not url:match("http") then
		url = "https://github.com/" .. url
	end
	vim.fn.jobstart({ cmd or "xdg-open", url }, { on_exit = function() end })
end

-- @desc Run the current file according to filetype
M.run_file = function()
	local fts = {
		python = "python %",
		javascript = "node %",
		typescript = "ts-node %",
		go = "go run %",
	}

	local cmd = string.format('TermExec cmd="%s"<cr>', fts[vim.bo.ft])
	vim.cmd(cmd)
end
return M
