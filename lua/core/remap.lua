vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) --open netrw

--vim.ekymap.set("n", "<leader>spell", vim.set.spell spelllang=en_us) -- enable spellcheck

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selected up or down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", '"+y', 'V"+y') -- be able to yank line to + buffer from normal mode

-- vim.keymap.set("v", "<tab>", "[[:s/^/	/<CR>")
-- vim.keymap.set("v", "<S-tab>", "[[:s/^	//<CR>")

vim.keymap.set("n", "J", "mzJ'z") --keep cursor at front when using J
vim.keymap.set("n", "<C-d>", "<C-d>zz") --keep cursor in the middle
--vim.keymap.set("n", "<C-u>", "<C-u>zz") --keep cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--vim.keymap.set("x", "<leader>p", '"_dp') --paste, but preserve register

vim.keymap.set("n", "<leader>y", '"+y') --yank into sys clip
vim.keymap.set("v", "<leader>y", '"+y')
--vim.keymap.set("n", "<leader>p", '"+p') --paste from sys clip -- done with Ctrl Shift V in kitty

vim.keymap.set("n", "<C-g>", "ggVG") --select all, probably a better way

--replace hovered word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--makes current file executable, via chmod
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--make a keymap for ctrl backspace to delete the last word inc punctuation while in edit mode
