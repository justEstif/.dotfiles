return {
	"echasnovski/mini.clue",
	opts = {
		triggers = {
			-- Leader triggers
			{ mode = "n", keys = "<Leader>" },
			{ mode = "x", keys = "<Leader>" },

			-- Built-in completion
			{ mode = "i", keys = "<C-x>" },

			-- `g` key
			{ mode = "n", keys = "g" },
			{ mode = "x", keys = "g" },

			-- Marks
			{ mode = "n", keys = "'" },
			{ mode = "n", keys = "`" },
			{ mode = "x", keys = "'" },
			{ mode = "x", keys = "`" },

			-- Registers
			{ mode = "n", keys = '"' },
			{ mode = "x", keys = '"' },
			{ mode = "i", keys = "<C-r>" },
			{ mode = "c", keys = "<C-r>" },

			-- Window commands
			{ mode = "n", keys = "<C-w>" },

			-- `z` key
			{ mode = "n", keys = "z" },
			{ mode = "x", keys = "z" },
		},

		window = {
			delay = 0,
			config = { width = "auto" },
		},
	},
	config = function(_, opts)
		local clue = require("mini.clue")
		clue.setup(vim.tbl_deep_extend("force", {
			clues = {
				_G.ES.leader_group_clues,

				-- Enhance this by adding descriptions for <Leader> mapping groups
				clue.gen_clues.builtin_completion(),
				clue.gen_clues.g(),
				clue.gen_clues.marks(),
				clue.gen_clues.registers(),
				clue.gen_clues.windows(),
				clue.gen_clues.z(),
			},
		}, opts))
	end,
}
