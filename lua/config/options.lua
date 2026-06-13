-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- enable soft line wrap
vim.opt.wrap = true

-- spell check language
vim.opt.spelllang = {}

if vim.g.neovide then
  vim.o.background = "dark"
  -- vim.o.guifont = "CodeNewRoman Nerd Font Mono:h16"
  vim.o.guifont = "Maple Mono Normal NF CN:h15:b"

  vim.g.neovide_cursor_animation_length = 0.30
  vim.g.neovide_cursor_trail_size = 0.6
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animation_in_insert_mode = true

  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_padding_right = 12

  vim.g.neovide_opacity = 0.85
  vim.g.neovide_normal_opacity = 0.85
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur = true

  vim.g.neovide_cursor_animation_length = 0.15
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_confirm_quit = true

  -- 隐藏菜单栏和底座全屏
  -- vim.g.neovide_macos_simple_fullscreen = true
  vim.g.neovide_remeber_window_size = true

  vim.g.neovide_highlight_matching_pair = true
  vim.g.neovide_proxy_icon = true
end
