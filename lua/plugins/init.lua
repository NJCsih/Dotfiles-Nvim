-- I'm using this as the plugin masterlist, like I did with packer, because I cant be bothered. I want it simple
-- I'm not smart enough to customize this editor all fancy like lol
    -- At least []'s config makes sense to me now as to how it works, doesnt seem to be what I need but it is nice.

require("lazy").setup({

	-- First Class -------------------------------------------------------------

	{
		"nvim-treesitter/nvim-treesitter", -- Treesitter, it's pretty cool
		config = function()
			require("plugins.treesitter")
		end,
	},

	{
		"nvim-neorg/neorg", -- Neorg, for note taking
		dependencies = { "luarocks.nvim" },
		lazy = true,
		ft = "norg",
		version = "*", -- Pin Neorg to the latest stable release
		config = function()
			require("plugins.neorg")
		end,
	},
	{
		"vhyrro/luarocks.nvim",
		config = true,
		lazy = true,
	},

	{
		"neovim/nvim-lspconfig", -- my lsp stuff, Just keeping it simple
		config = function()
			require("plugins.lsp")
		end,
	},
	{
		"williamboman/mason.nvim", -- installer for stuff, TODO config issue for autoinstall
		lazy = false,
		config = function()
			require("plugins.mason")
			-- I need to setup mason-lspconfig.nvim to handle automatic installation, the current mason config does nothing rn :/
		end,
	},

	{
		"hrsh7th/nvim-cmp", -- completion, very nice
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

	{ -- image rendering
		"edluffy/hologram.nvim",
		config = function()
			require('hologram').setup {
				auto_display = true -- WIP automatic markdown image display, may be prone to breaking
			}

			require("plugins.latexrender") -- This is so cool!
		end,
	},

	{
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

	{
		"stevearc/conform.nvim", -- autoformatting I think
		event = BufEnter,
		config = function()
			require("plugins.conform")
		end,
	},

	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)
		end,
		event = BufEnter,
	},


	-- Second Class --------------------------------------------------------------

	{ -- lualine, bar across bottom
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine")
		end,
		lazy = false,
	},

	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.harpoon")
		end,
		lazy = false,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.telescope")
		end,
		lazy = false,
	},

	{
		"nvim-lua/plenary.nvim",
	},



	{
		"jbyuki/venn.nvim", -- for drawing my little diagrams
		config = function()
			require("plugins.venn")
		end,
	},

	{
		"shortcuts/no-neck-pain.nvim", -- center buffer, I just do :NoNeckPain
		config = function()
			require("plugins.no-neck-pain")
		end,
	},

	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- prettier virtual text lines for lsp
		config = function()
			require("lsp_lines").setup()
			vim.diagnostic.config({ virtual_text = false, })
		end,
		event = BufEnter,
		dependencies = { "neovim/nvim-lspconfig" },
	},

	{
		"folke/which-key.nvim", -- would be pretty cool, need to setup
		enabled = false,
	},

	{
		"folke/neodev.nvim", -- for neovim development, needs to be setup. Not a priority
		enabled = false,
	},

	--  { "ellisonleao/gruvbox.nvim",
	--    config = function()
	--        vim.cmd.colorscheme("gruvbox")
	--    end,
	--  },
	{
		"goolord/alpha-nvim",
		config = function()
			require("plugins.alpha")
		end,
		lazy = false,
	},

	{
		--"catppuccin/nvim", -- colorscheme
		--"folke/tokoyonight.nvim",
		"navarasu/onedark.nvim",
		config = function()
			--vim.cmd.colorscheme("catppuccin-mocha")
			vim.cmd.colorscheme("onedark")

			--vim.cmd([[highlight Normal guibg=none]])
			--vim.cmd([[highlight NormalNC guibg=none]])
		end,
	},

})
