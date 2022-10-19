-------------------
-- O P T I O N S --
-------------------

local o = vim.opt

o.swapfile = false
o.scrolloff = 8
o.sidescrolloff = 20
o.wrap = false
o.cmdheight = 1
-- o.laststatus = 1
o.background = "dark"
o.numberwidth = 1
o.cursorline = true
o.list = true
o.listchars:append "eol:↲"
o.listchars:append "tab:<->"
-- o.listchars:append "tab:>-,trail:-,eol:<,nbsp:%"
o.listchars:append "extends:>,precedes:<"
o.clipboard = ""

-----------------------
-- WSL RELATED STUFF --
-----------------------
-- if vim.fn.has "wsl" == 1 then
--   vim.cmd "set guifont='Iosevka'"
--   vim.g.clipboard = {
--     copy = {
--       ["+"] = "win32yank.exe -i --crlf",
--       ["*"] = "win32yank.exe -i --crlf",
--     },
--     paste = {
--       ["+"] = "win32yank.exe -o --lf",
--       ["*"] = "win32yank.exe -o --lf",
--     },
--   }
-- end
