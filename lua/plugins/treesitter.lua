vim.cmd('TSUpdate')

require('nvim-treesitter').setup {

  ensure_installed = { "norg", "c", "lua", "vim", "vimdoc", "query", "java", "cpp" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },

  indent = { enable = true },
}

-- Make TS auto-enable? Not sure why it doesnt.
vim.cmd([[
    TSEnable highlight
]])
