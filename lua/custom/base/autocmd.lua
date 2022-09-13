-----------------------------
-- A U T O C O M M A N D S --
-----------------------------

local CursorLine = vim.api.nvim_create_augroup("CursorLine", { clear = true })
---------------------------------------------------------------------
-- TO HIGHLIGHT CURSORLINE WHICH IDK WHY NVCHAD DOESN'T BY DEFAULT --
---------------------------------------------------------------------
-- vim.api.nvim_create_autocmd("BufEnter", {
--   command = "hi CursorLine guibg=#24242d",
--   group = CursorLine,
-- })
-- vim.api.nvim_create_autocmd("InsertEnter", {
-- command = "normal zz",
-- command = "hi CursorLine guibg=#353641",
-- group = CursorLine,
-- })

-- ~ Set Colorscheme if you don't like any of the NvChad themes ~ --
-- vim.api.nvim_create_autocmd("BufEnter", { command = "source ~/.config/nvim/lua/custom/init.lua", group = CursorLine })
-- vim.api.nvim_create_autocmd(
--   "BufEnter",
--   { command = "source ~/.config/nvim/lua/custom/plugins/lualine.lua", group = CursorLine }
-- )

----------------------------------------------------
-- TO CHANGE CURSORLINE COLOR WHEN IN INSERT MODE --
----------------------------------------------------
vim.api.nvim_create_autocmd("InsertEnter", {
  command = "hi CursorLine guibg=#22262a",
  group = CursorLine,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  command = "hi CursorLine guibg=none",
  group = CursorLine,
})
--
--------------------------------------------------------------
-- LIKE RUN FILE IN VSCODE BUT WITH SPECIFIC FILETYPES ONLY --
--------------------------------------------------------------
local RunFile = vim.api.nvim_create_augroup("RunFile", { clear = true })
vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = "javascript", command = "nnoremap <leader>B :!node %<CR>", group = RunFile }
)
vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = "python", command = "nnoremap <leader>B :!python3 %<CR>", group = RunFile }
)
-----------------------------------------------
-- QUIT NVIM IF NVIM-TREE IS THE LAST BUFFER --
-----------------------------------------------
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match "NvimTree_" ~= nil then
      vim.cmd "quit"
    end
  end,
})

----------------------------------------------------------------
-- IDK BUT WHY THIS AUTOCOMMAND'S LUA COUNTERPART DOES'T WORK --
----------------------------------------------------------------

-- Return to last edit position when opening files aka remeber cursor position --
vim.cmd [[
  augroup last_cursor_position
    autocmd!
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"zvzz" | endif
  augroup END
]]
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

--------------------------------
-- SOME SMALL SIMPLE AUTOCMDS --
--------------------------------
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
