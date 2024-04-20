local lspconfig = require("lspconfig")
--local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.clangd.setup({
	--capabilities = default capabilities, with offsetEncoding utf-8
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	--	root_dir = vim.fs.dirname(vim.fs.find({ -- shamelessly stole from above
	--		'.clangd',
	--		'.clang-tidy',
	--		'.clang-format',
	--		'compile_commands.json',
	--		'compile_flags.txt',
	--		'configure.ac',
	--		'.git'
	--	}, { pward = true})[1]),
	single_file_support = true,
})
