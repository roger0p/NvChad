-------------------
-- O P T I O N S --
-------------------

local opt = vim.opt
local g = vim.g

opt.swapfile = false
opt.scrolloff = 10
opt.wrap = false
opt.cmdheight = 1
opt.numberwidth = 1
opt.cursorline = true
g.gruvbox_material_disable_italic_comment = 0
g.gruvbox_material_background = "dark"
g.gruvbox_material_better_performance = 1
g.catppuccin_flavour = "mocha"
g.tokyodark_transparent_background = true
g.tokyodark_enable_italic_comment = true
g.tokyodark_enable_italic = false
g.tokyodark_color_gamma = "1.0"

-----------------------------
-- A U T O C O M M A N D S --
-----------------------------

local CursorLine = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  command = "hi CursorLine guibg=#161722",
  group = CursorLine,
})
vim.api.nvim_create_autocmd("InsertEnter", {
  command = "hi CursorLine guibg=#252631",
  group = CursorLine,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  command = "hi CursorLine guibg=#161722",
  group = CursorLine,
})



local RunFile = vim.api.nvim_create_augroup("RunFile", { clear = true })
vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = "javascript", command = "nnoremap <leader>B :!node %<CR>", group = RunFile }
)
vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = "python", command = "nnoremap <leader>B :!python3 %<CR>", group = RunFile }
)
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match "NvimTree_" ~= nil then
      vim.cmd "quit"
    end
  end,
})



-------------
--IDK but why this autocommand's lua counterpart does't work
vim.cmd [[
  augroup last_cursor_position
    autocmd!
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"zvzz" | endif
  augroup END
]]
-- Return to last edit position when opening files
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   group = "bufcheck",
--   pattern = "*",
--   callback = function()
--     if fn.line "'\"" > 0 and fn.line "'\"" <= fn.line "$" then
--       fn.setpos(".", fn.getpos "'\"")
--       -- vim.cmd('normal zz') -- how do I center the buffer in a sane way??
--       vim.cmd "silent! foldopen"
--     end
--   end,
-- })

vim.api.nvim_create_augroup("bufcheck", { clear = true })

-- reload config file on change
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "bufcheck",
  pattern = vim.env.MYVIMRC,
  command = "silent source %",
})

-- highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "bufcheck",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { timeout = 500 }
  end,
})

-- sync clipboards because I'm easily confused
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   group = "bufcheck",
--   pattern = "*",
--   callback = function()
--     fn.setreg("+", fn.getreg "*")
--   end,
-- })

-- start terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  group = "bufcheck",
  pattern = "*",
  command = "startinsert | set winfixheight",
})

-- start git messages in insert mode
vim.api.nvim_create_autocmd("FileType", {
  group = "bufcheck",
  pattern = { "gitcommit", "gitrebase" },
  command = "startinsert | 1",
})

-- pager mappings for Manual
vim.api.nvim_create_autocmd("FileType", {
  group = "bufcheck",
  pattern = "man",
  callback = function()
    vim.keymap.set("n", "<enter>", "K", { buffer = true })
    vim.keymap.set("n", "<backspace>", "<c-o>", { buffer = true })
  end,
})
