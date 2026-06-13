-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- -- 保存所有文件（Command+S）
vim.keymap.set({ "n", "i", "v" }, "<D-s>", "<cmd>wa<CR>", { desc = "Save all files" })
