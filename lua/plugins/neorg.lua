--keybinds:
vim.keymap.set("n", "<leader>cb", ":Neorg keybind all core.looking-glass.magnify-code-block<cr>")

vim.wo.foldlevel = 99
vim.wo.conceallevel = 2

-- config
require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/notes",
				},
				default_workspace = "notes",
			},
		},
		["core.clipboard.code-blocks"] = {}, -- removes leading whitespace when copying from a code block
		["core.esupports.indent"] = {
			--req core.autocommands
			--req core.integrations.treesitter
		},
		["core.esupports.metagen"] = { -- generates metatext at top
			config = {
				type = "auto",
			},
			--req core.autocommands
			--req core.integrations.treesitter
			--req core.keybinds
		},
		--		["core.itero"] = { -- iterates list
		--			--req core.integrations.treesitter
		--			--req core.keybinds
		--		},
		["core.looking-glass"] = {
			--req core.integrations.treesitter
			--req core.keybinds
			--req core.ui
			config = {
				function()
					--vim.keymap.set("n", "<leader>cb", ":Neorg keybind all core.looking-glass.magnify-code-block<cr>")
				end,
			},
			-- It would be really cool to be able to execute the buffer and display that in a split
		},
		["core.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
			-- requires core.integrations.treesitter
		},
		["core.concealer"] = {
			config = {
				folds = true, -- will need a folding nvim plugin
				icon_preset = "basic",
				init_open_folds = "auto", -- look into this behavior
			},
			--req core.autocommands
			--req core.integrations.treesitter
		},
		["core.export"] = {}, -- requires core.integrations.treesitter
		--core.highlights -- Manages your highlight groups with this module.
		["core.syntax"] = {}, -- snytax highlighting in code blocks
		["core.integrations.treesitter"] = {
			config = {
				configure_parsers = true,
				install_parsers = true,
			},
			--req core.keybinds
			--req core.mode
			--req core.neorgcmd
		},
		--["core.integrations.image"] = {}, -- Images and latex in neorg
		--["core.latex.renderer"] = {},
		--["Core Latex Renderer"] = {},
	},
})
