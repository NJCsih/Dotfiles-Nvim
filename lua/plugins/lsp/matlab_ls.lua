local lspconfig = require("lspconfig")
--local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.matlab_ls.setup({
	matlab = {
		indexWorkspace = false,
		installPath = "",
		matlabConnectionTiming = "onStart",
		-- TODO Fix root dir? the docs just say "see source file"
		telemetry = false,
	},
})

