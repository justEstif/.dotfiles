local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-- General
opt.mouse = "a" -- enable mouse support
opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
opt.swapfile = false -- Don't modify file open in another nvim processs
opt.joinspaces = false -- Don't autoinsert two spaces after '.', '?', '!' for join command.
opt.encoding = "utf-8" -- Display this encoding.
opt.fileencoding = "utf-8" -- Use this encoding when writing to file.
opt.wrap = true -- wrap long lines

-- Search
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern
opt.gdefault = true -- default g flag to search
opt.showmatch = true -- Highlight matching parenthesis

-- UI
opt.pumheight = 10 -- pop up menu height
opt.cursorline = true -- show cursorline
opt.relativenumber = false -- show relativenumber
opt.number = false
opt.signcolumn = "yes:1" -- sign column default size
opt.conceallevel = 0 -- `` is visible in markdown files

-- new window direction
opt.splitright = true -- Horizontal split to the bottom
opt.splitbelow = true -- Horizontal split to the bottom

-- fold
opt.fillchars = { fold = " " }
opt.foldmethod = "indent"
opt.foldenable = false
opt.foldlevel = 99
g.markdown_folding = 1 -- enable markdown folding

-- Tabs, indent
opt.expandtab = true -- Convert tabs to spaces
opt.tabstop = 2 -- Insert 2 spaces for a tab
opt.smarttab = true -- Make tabbing smarter (will realize you have 2 vs 4)
opt.shiftwidth = 2 -- Use this number of spaces for indentation
opt.smartindent = true -- Make indenting smart
opt.autoindent = true -- Use auto indent

-- Memory, CPU
opt.hidden = true -- Enable background buffers
opt.history = 200 -- Remember N lines in history
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 300 -- ms to wait for trigger an event
opt.undofile = true -- enable persistent undo
opt.autoread = true -- auto read files changes

-- fix markdown indentation settings
g.markdown_recommended_style = 0

g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.loaded_python3_provider = 0

opt.iskeyword:append("-") -- treat dash separated words as a word text object
opt.nrformats:append("unsigned") -- inc/dec the last digit of dashed

-- ignore these files in search
opt.wildignore:append({
	"*.zip",
	"*.png",
	"*.jpg",
	"*.gif",
	"*.pdf",
	"*DS_Store*",
	"*/.git/*",
	"*/node_modules/*",
	"*/build/*",
	"package-lock.json",
})

-- Disable builtins plugins
local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor",
	"rplugin",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"tohtml",
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end
