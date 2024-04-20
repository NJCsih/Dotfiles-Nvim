local lspconfig = require("lspconfig")
--local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.texlab.setup({

	--TexlabBuild: Build the current buffer
	--TexlabForward: Forward search from current position

	cmd = { "texlab" },

	filetypes = { "tex", "plaintex", "bib" },

	--root_dir :

	settings = {
		texlab = {
			auxDirectory = ".",
			bibtexFormatter = "texlab",
			build = {
				args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
				executable = "latexmk",
				forwardSearchAfter = false,
				onSave = false,
			},
			chktex = {
				onEdit = false,
				onOpenAndSave = false,
			},
			diagnosticsDelay = 300,
			formatterLineLength = 80,
			forwardSearch = {
				args = {},
			},
			latexFormatter = "latexindent",
			latexindent = {
				modifyLineBreaks = false,
			},
		},
	},

	single_file_support = true,
})
