local cmp = require("cmp")

--   פּ ﯟ   some other good icons
local kind_icons = {
	Text = "󰊄",
	Method = "m",
	Function = "󰊕",
	Constructor = "",
	Field = "",
	Variable = "󰫧",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "󰌆",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "󰉺",
} -- More at: https://www.nerdfonts.com/cheat-sheet

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		--opts.mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-l>"] = cmp.mapping.confirm({ select = true }),
		--["<C-l>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),

		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<C-<CR>>"] = cmp.mapping.confirm({ select = true }),
		--		["<Tab>"] = cmp.mapping(function(fallback)
		--			if cmp.visible() then
		--				cmp.select_next_item()
		--			elseif luasnip.expandable() then
		--				luasnip.expand()
		--			elseif luasnip.expand_or_jumpable() then
		--				luasnip.expand_or_jump()
		--			elseif check_backspace() then
		--				fallback()
		--			else
		--				--fallback()
		--			end
		--		end, {
		--			"i",
		--			"s",
		--		}
		--		),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	}),
	function()
		--vim.opt.completeopt = { menu menuone noselect }
	end,
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				luasnip = "[Snippet]",
				path = "[Path]",
				cmdline = "[Commandline]",
				latex_symbols = "[Latex]",
				nvim_lsp = "[LSP]",
				cmp_vimtex = "[Vimtex]",
				buffer = "[Buffer]",
				nvim_scissors = "[Scissors]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		-- There are sources for vimtex and pandoc, when setting thoes up use them!
		-- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		--{ name = "cmdline" },
		{ name = "nvim_lsp" },

		{ name = "nvim_scissors" },

		--{ name = "cmp_vimtex" }, -- find the real name

		---		{ name = "tmux" }, -- dunno how to test
		--		{ name = "emoji" },
		--		{ name = "nerdfont" }, -- no work
		--
		{
			name = "latex_symbols",
			option = {
				strategy = 0, -- mixed
				-- 0 mixed Show the command and insert the symbol
				-- 1 julia Show and insert the symbol
				-- 2 latex Show and insert the command
			},
		},
		---		{ name = "nvim_lua" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = true,
		native_menu = false,
	},
})

