-- For this config I'm finally leaving packer, if not how I do things. The goal
-- is to have a simple, easy to maintain, config. Where if I just ignore it for
-- months (or a breaking update is released), the layout is exceptionally easy
-- to fix.

-- Keep it simple, stupid. - This old tony, likely many others

-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- set leader before anything
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- setup plugins and plugin-independent settings
require("plugins") -- Lazy config is setup from within lua.plugins.init
require("core")
