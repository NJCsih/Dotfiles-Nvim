require("mason").setup({
	ensure_isntalled = { -- this isnt a real mason param :/
	                     -- So I guess this is just a list of stuff I need to manually install each time I freshly install? Unless lazy can install these
						 -- I need to go use mason-lspconfig.nvim :p
		"texlab",
		"lua-language-server",
		"stylua",
		--"clang-format",
		--"clangd",
		--"codelldb",
		"marksman",
		--"java-test",
		--"jdtls",
		--"rust-anayzer",
	},
})
