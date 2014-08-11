set number
set nocompatible    "Need to set nocompatible for the cool tricks in vim to work
set showcmd         "Shows what you are typing out as a command
syntax on           "Allows for syntax highlighting

"colorscheme desert  "Set color scheme

"Tab settings:
set tabstop=4       "Changes number of spaces used for tabbing
set shiftwidth=4    "Changes number of spaces used for indentation
set expandtab       "Uses space characters when indenting:

set ignorecase      "This ignores case when searching for something
set smartcase       "Searches FOR case if case sensitive query is made
set incsearch       "Searches while you type!

set textwidth=79    "Maximum width of text that is being inserted. A longer
                    "line will be broken after white space to get this width
set ruler           "Show the line and column number of the cursor position,
                    "separated by a comma.

set showmatch       "Shows the matching bracket that is on the cursor

set cryptmethod=blowfish "Uses a better encryption method than the default

hi ColorColumn  cterm=NONE ctermbg=8
set colorcolumn=80 "Creates a bar at column 80: makes code look neat

"Creates crosshaird to trac the cursor
hi CursorLine   cterm=NONE ctermbg=8
hi CursorColumn cterm=NONE ctermbg=8
set cursorline!
set cursorcolumn!

"set vpslit and split to the correct sides
set splitright
set splitbelow

"In the Rutgers_Mobile Directory, the tabstop and shiftwidth tab are one less
autocmd BufRead,BufNewFile /heroes/u1/rm934/Projects/Rutgers_Mobile/server* setlocal tabstop=3 shiftwidth=3
