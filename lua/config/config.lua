local opt = vim.opt
local cmd = vim.cmd

opt.cursorline=true
opt.number=true
opt.relativenumber=true
opt.termguicolors=true

vim.g.mapleader = " "

cmd("set expandtab")
cmd("set tabstop=2")
cmd("set softtabstop=2")
cmd("set shiftwidth=2")
