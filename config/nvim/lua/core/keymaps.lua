-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local map = require("core.utils").map

-- disable keys
local disable_keys = { "<up>", "<left>", "<down>", "<right>", "gh", "gl", "gL", "," }
for _, disable_key in pairs(disable_keys) do
	map("", disable_key, "<nop>")
end

vim.g.mapleader = ","

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------
-- Buffers
map("n", "<leader>q", ":bufdo bdelete<CR>:lua MiniStarter.open()<cr>") -- kill all buffers

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- Indent
map("v", "<", "<gv") -- stay in indent mode
map("v", ">", ">gv") -- stay in indent mode

-- Others
map("v", "p", '"_dP') -- keep the yanked when pasting in visual mode
map("v", "@", ":normal @") -- apply macro on visual range
map("t", "<Esc>", [[<C-\><C-n>]]) -- esc exit terminal
map({ "n", "v" }, "<Esc>", ":nohl<CR>") -- clear search highlights
map("n", "<leader>r", ":so %<CR>") -- Reload configuration without restart nvim
map("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>") -- open link under cursor

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>") -- find file in dir
map("n", "<C-n>", ":Telescope file_browser<CR>") -- open/close file browser
map("n", "ms", ":Telescope live_grep<CR>") -- find text in current dir
map("n", "mt", ":TodoTelescope<CR>") -- open todo list

-- other keybindings in:
-- plugins.lsp/handlers
-- plugins.nvim-cmp
-- plugins.telescope/file-explorer
-- plugins.toggleterm -> <C-t>
