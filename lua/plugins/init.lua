-- I'm using this as the plugin masterlist, like I did with packer, because I cant be bothered. I want it simple
-- I'm not smart enough to customize this editor all fancy like lol
    -- At least []'s config makes sense to me now as to how it works, doesnt seem to be what I need but it is nice.

require("lazy").setup({

	-- First Class -------------------------------------------------------------

	{ -- Treesitter, it's pretty cool
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.treesitter")
		end,
	},


	{ -- Neorg, for note taking
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim" },
		lazy = true,
		ft = "norg",
		tag = "v7.0.0", -- Pin Neorg to the latest stable release
		config = function()
			require("plugins.neorg")
		end,
	},
--	{
--		"vhyrro/luarocks.nvim",
--		config = true,
--		lazy = true,
--	},


	{ -- My lsp stuff, Just keeping it simple
	--   My configs are adapted (largely stolen) from https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lsp")
		end,
	},
	{ -- Installer for stuff, TODO config issue for autoinstall
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("plugins.mason")
			-- I need to setup mason-lspconfig.nvim to handle automatic installation, the current mason config does nothing rn :/
		end,
	},


	{ -- Completion, I use weird keybinds
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"kdheepak/cmp-latex-symbols",
		},
		event = BufEnter,
		config = function()
			require("plugins.nvim-cmp")
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp", -- lsp completions
		"hrsh7th/cmp-buffer",   -- buffer completions
		"hrsh7th/cmp-path",     -- path completions
		"hrsh7th/cmp-cmdline",  -- cmdline completions
		"saadparwaiz1/cmp_luasnip", -- snippet completions
		"kdheepak/cmp-latex-symbols", -- Type latex symbols by their name
		--"hrsh7th/cmp-nvim-lua", -- idk?
		lazy = true,
		event = BufEnter,
	},


	{ -- LaTeX compilation/editing via nvim. -- need latex installed on system
		"lervag/vimtex",
		dependencies = { "micangl/cmp-vimtex", },
		config = function()
			require("plugins.vimtex")
		end,
		enabled = false,
	},
	{
		"micangl/cmp-vimtex",
		enabled = false,
	},


	{ -- Image rendering -- Will be for notes and latex rendering
		"edluffy/hologram.nvim",
		config = function()
			require('hologram').setup {
				auto_display = true -- WIP automatic markdown image display, may be prone to breaking
			}

			-- Latex rendering provided by https://github.com/lervag/vimtex
			require("plugins.latexrender") -- This is so cool! -- Still a hair jank.
		end,
	},


	{ -- Git integration
		"tpope/vim-fugitive",
	},


	--	{
	--		"pocco81/auto-save.nvim",
	--		config = function()
	--			require("auto-save")
	--		end,
	--		lazy = true,
	--		ft = "norg",
	--	},

	--  { "3rd/image.nvim",
	--    rocks = { "magick" },
	--	config = function()
	--		require("image").setup({
	--        backend = "kitty",
	--        integrations = {
	--          markdown = {
	--            enabled = true,
	--            clear_in_insert_mode = false,
	--            download_remote_images = true,
	--            only_render_image_at_cursor = false,
	--            filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
	--          },
	--          neorg = {
	--            enabled = true,
	--            clear_in_insert_mode = false,
	--            download_remote_images = true,
	--            only_render_image_at_cursor = false,
	--            filetypes = { "norg" },
	--          },
	--        },
	--        max_width = nil,
	--        max_height = nil,
	--        max_width_window_percentage = nil,
	--        max_height_window_percentage = 50,
	--        window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
	--        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
	--        editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
	--        tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
	--        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
	--      })
	--    end,
	--  },


	{ -- Autoformatting
		"stevearc/conform.nvim",
		event = BufEnter,
		config = function()
			require("plugins.conform")
		end,
	},


	{ -- Time travel through undos and timelines -- Very nice
		"mbbill/undotree",
		config = function()
			vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)
		end,
		event = BufEnter,
	},


	-- Second Class --------------------------------------------------------------

	{ -- Lualine, Bottom bar
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine")
		end,
		lazy = false,
	},


	{ -- Fast file navigation, my keybinds are weird, ie. no ^u, but I dont really use ^u and ^d?
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.harpoon")
		end,
		lazy = false,
	},


	{ -- Fuzzy finder, very nice
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.telescope")
		end,
		lazy = false,
	},


	{ -- TJ Devires' plugin, a dependency for a lot
		"nvim-lua/plenary.nvim",
		lazy = false,
	},


	{ -- show git diff in butter
		"airblade/vim-gitgutter",
		event = BufEnter,
	},


	{ -- For drawing my little circuit diagrams
		"jbyuki/venn.nvim",
		config = function()
			require("plugins.venn")
		end,
	},


	{ -- Center buffer, I dont use this much
		"shortcuts/no-neck-pain.nvim",
		config = function()
			require("plugins.no-neck-pain")
		end,
	},


	{ -- Display lsp issues in virtual lines showing where the error is
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
			vim.diagnostic.config({ virtual_text = false, })
		end,
		event = BufEnter,
		dependencies = { "neovim/nvim-lspconfig" },
	},


	{ -- Better keybind tracking, need to actually setup
		"folke/which-key.nvim",
		enabled = false,
	},


	{ -- for neovim development, needs to be setup. Not a priority
		"folke/neodev.nvim",
		enabled = false,
	},


	{ -- Splash screen on startup without specified directory
		"goolord/alpha-nvim",
		config = function()
			require("plugins.alpha")
		end,
		lazy = false,
	},


	{
		--"catppuccin/nvim", -- colorscheme
		--"ellisonleao/gruvbox.nvim",
		"navarasu/onedark.nvim",
		--"folke/tokoyonight.nvim",
		config = function()
			--vim.cmd.colorscheme("catppuccin-mocha")
			--vim.cmd.colorscheme("gruvbox")
			vim.cmd.colorscheme("onedark")

			vim.cmd([[highlight Normal guibg=none]])
			vim.cmd([[highlight NormalNC guibg=none]])
			vim.cmd([[highlight EndOfBuffer guibg=none]])
			vim.cmd([[highlight SignColumn guibg=none]])
		end,
	},

})
