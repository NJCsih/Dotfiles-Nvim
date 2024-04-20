local lspconfig = require("lspconfig")
--local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.pyright.setup({
	python = {
		cmd = { "pyright", "--stdio" },

		filetypes = { "python" },

		-- root_dir = see source file

		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "openFilesOnly",
					useLibraryCodeForTypes = true,
				},
			},
		},

		single_file_support = true,
	},
})
