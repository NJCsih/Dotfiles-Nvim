-- This is some autocommands I've made just as I go, some are global, others
-- are honestly just for filetype specific settings. Probably a better way to
-- do that if I'm honest. Not important right now, but I'll throw a:
-- TODO: Find a cleaner solution for filetype specific settings.

-- Global ----------------------------------------------------------------------


-- The cursor must always be centered :p
-- This seems too agressive for me, like especially near eof
-- Just need to fix smoothscroll now
vim.opt.scrolloff = 15 -- The compromise
vim.api.nvim_create_autocmd({ "CursorMoved" }, {
	-- pattern = { "bash"  -- make this not work on a terminal window
	callback = function()
		vim.cmd([[exec 'norm zz']])
	end,
})

--	-- set transparency when colorscheme set
--	vim.api.nvim_create_autocmd("ColorScheme", {
--		callback = function()
--			vim.cmd([[highlight Normal guibg=none]])
--			vim.cmd([[highlight NormalNC guibg=none]])
--		end,
--	})

-- Filetype --------------------------------------------------------------------

-- C/cpp
-- vim.api.nvim_create_autocmd("BufWritePre", { -- on save autoformat
-- 	pattern = { "*.c", "*.cpp", "*.h", "*.cc", "*.lua", "*.nix" },
-- 	callback = function()
-- 		require("conform").format({
-- 			lsp_fallback = true,
-- 			async = false,
-- 			timeout_ms = 1000,
-- 		})
-- 	end,
-- })


vim.api.nvim_create_autocmd({ "FileType" }, {-- needs to be reviewed
	pattern = { "netrw" },
	callback = function()
		print("Opening netrw") -- why this no work
		vim.opt.number = true
		vim.opt.relativenumber = true
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, { -- set nvim settings on open buffer
	pattern = { "*.asm" },
	callback = function()
		--vim.opt.number = true
		--vim.opt.relativenumber = true
		--vim.opt_local.textwidth = 80
		vim.opt_local.colorcolumn = 80
		vim.opt_local.expandtab = true
	end,
})

-- Filetype specific options, on entering buffers
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.norg", "*.txt" }, -- "*.md", I think real tabs would be nice
	callback = function()
		vim.opt_local.spell = true -- enable spellcheck
		vim.opt_local.expandtab = true -- use spaces not tabs
		vim.opt_local.signcolumn = "no" -- disable colorcol for these
		--vim.cmd(TSBufEnable highlight)
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.norg", "*.md" },
	callback = function()
		vim.opt_local.listchars = {
			--eol = '⤶',
			space = " ",
			trail = "•",
			tab = "| ",
			extends = "◀",
			precedes = "▶",
		}
	end,
})
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.md" },
	callback = function()
		-- Regex insert a tab at the front of the line
		vim.keymap.set("v", "<TAB>", ":s/^/\t/<CR>gv")
		-- Regex remove a tab at the front of the line
		vim.keymap.set("v", "<S-TAB>", ":s/^\t//<CR>gv")
		vim.opt_local.expandtab = false
	end,
})
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.c", "*.cpp", "*.h", "*.cc", "*.zig", "*.zir" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true --use spaces tabs
		vim.opt_local.colorcolumn = "80" -- Set colorbar at 80 chars
	end,
})
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.lua" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = false --use real tabs
		vim.opt_local.colorcolumn = "100" -- Set colorbar at 80 chars
	end,
})
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.nix", "*.kbd" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true --use real tabs
		vim.opt_local.colorcolumn = "100" -- Set colorbar at 80 chars
	end,
})
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.java" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = false --use real tabs
		vim.opt_local.colorcolumn = "80" -- Set colorbar at 80 chars
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.opt_local.spell = false
		vim.opt_local.scrolloff = 0
		vim.opt_local.sidescrolloff = 0
		vim.opt_local.relativenumber = false
		vim.opt_local.number = false
		vim.opt_local.signcolumn = "no"
		vim.opt_local.statuscolumn = ""
	end,
})
