local lspconfig = require("lspconfig")
--local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.jdtls.setup({
	cmd = { "jdtls" },
	--	root_dir = {
	--		{
	--			-- Single-module projects
	--			{
	--				'build.xml', -- Ant
	--				'pom.xml', -- Maven
	--				'settings.gradle', -- Gradle
	--				'settings.gradle.kts', -- Gradle
	--			},
	--			-- Multi-module projects
	--			{ 'build.gradle', 'build.gradle.kts' },
	--		} or vim.fn.getcwd()
	--	},
	--root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', '.gitignore', 'mvnw'}, { upward = true })[1]),

	--root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
	--root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
	-- TODO Fix root dir
	--root_dir = "~/",
	single_file_support = true,
})
