" If you accidently press ctrl+z, type fg in the command line.  ref: https://github.com/yuanqing/vim-basics/blob/master/README.md#the-ctrl--z-problem

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Miscellaneous Settings                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible    "Need to set nocompatible for the cool tricks in vim to work
filetype off        "Need for vundle to work
set showcmd         "Shows what you are typing out as a command
syntax on           "Allows for syntax highlighting
syntax enable
set number
colorscheme molokai  "Set color scheme

"hi Normal ctermfg=252 ctermbg=NONE
"Set highlighting full search term on + change highlighting color to light blue
set hlsearch
hi Search cterm=NONE ctermfg=white ctermbg=blue
set ruler           "Show the line and column number of the cursor position,
                "separated by a comma.
set showmatch       "Shows the matching bracket that is on the cursor
set cryptmethod=blowfish "Uses a better encryption method than the default
"Tab Settings
"set tabstop=4       "Changes number of spaces used for tabbing
"set shiftwidth=4    "Changes number of spaces used for indentation
set tabstop=2       "Changes number of spaces used for tabbing
set shiftwidth=2    "Changes number of spaces used for indentation
set expandtab       "Uses space characters when indenting"
set autoindent      "Indents next line similarily as the current one"
set smarttab        "Deletes # of spaces for a tab when using backspace
set smartindent     "Automatically inserts one extra level of indentation"
set showcmd         "Show normal mode keypresses at the bottom of the screen"
set confirm         "Dialog asking to confirm things instead of erroring"
set ignorecase      "This ignores case when searching for something
set smartcase       "Searches FOR case if case sensitive query is made
set incsearch       "Searches while you type!
"set textwidth=79    "Maximum width of text that is being inserted. A longer
                "line will be broken after white space to get this width
set encoding=utf-8
set scrolloff=3
set mouse=a         "Allow mouse use in files opened by vim
set showmode
set hidden
set wildmenu
set wildmode=list:longest
"set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
"Shows # of lines your cursor is away from other lines
"set relativenumber
set undofile

"Set tab space to 2 for scheme files
au FileType scheme setl sw=2 sts=2 et
au FileType python setl sw=2 sts=2 et

"Color Column Settings
"hi ColorColumn  cterm=NONE ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)
"set colorcolumn=80 "Creates a bar at column 80: makes code look neat
"Evil colorcolumn setting:
""hi ColorColumn ctermbg=red ctermfg=blue
""exec 'set colorcolumn=' . join(range(2,80,3), ',')
"Column Settings
"Creates crosshaird to trac the cursor
"hi CursorLine   cterm=NONE ctermbg=8
"hi CursorColumn cterm=NONE ctermbg=8
"set cursorline!
"set cursorcolumn!
"set vpslit and split to the correct sides
set splitright
set splitbelow
"Backup Settings
set noswapfile      "NO MORE SWAP FILES!! BWHAHAHA
set backup          "Setup backup
"backup locations: make sure they exist!
set backupdir=~/.vim/backup//
set directory=~/.vim/tmp//
set undodir=~/.vim/undo//
"Map Settings
"Map ctrl+s to save document
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

"Automatically add braces!
"inoremap { {<CR><BS>}<Esc>ko

"Spell Check Settings
"autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
"autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.pdf setlocal spell spelllang=en_us
au BufRead,BufNewFile *.go set filetype=go
"View Settings
"save view + load view automatically
set viewoptions-=options
augroup vimrc
autocmd BufWritePost *
\   if expand('%') != '' && &buftype !~ 'nofile'
\|      mkview
\|  endif
autocmd BufRead *
\   if expand('%') != '' && &buftype !~ 'nofile'
\|      silent loadview
\|  endif
augroup END
"Template Settings
au BufNewFile * silent! 0r ~/.vim/skeleton/template.%:e

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Vundle Settings                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/powerline-fonts'
Plugin 'sheerun/vim-polyglot'
Plugin 'osyo-manga/vim-marching'  "async clang code completion
Plugin 'airblade/vim-gitgutter'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'          " for deoplete.nvim
Plugin 'roxma/vim-hug-neovim-rpc'       " for deoplete.nvim
Plugin 'dense-analysis/ale'       " general async linter.  replacement for syntastic
"  Plugin 'scrooloose/syntastic'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'twerth/ir_black'
"Plugin 'elzr/vim-json'
"Plugin 'syngan/vim-vimlint'
"Plugin 'ynkdir/vim-vimlparser'
"Plugin 'kien/ctrlp.vim'
"Plugin 'tpope/vim-fugitive'
"Plugin 'ervandew/eclim'
"Plugin 'Rip-Rip/clang_complete'
"Plugin 'SirVer/ultisnips'
"Plugin 'Raimondi/delimitMate'
"Plugin 'ujihisa/neco-look'  "autocomplete english words
"Plugin 'vim-scripts/HTML-AutoCloseTag'
"Plugin 'wlangstroth/vim-racket'
"Plugin 'mbbill/undotree'
"Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'gerw/vim-latex-suite'
"Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neosnippet-snippets'
"Plugin 'Shougo/vimproc.vim'
"Plugin 'fatih/vim-go'
"for web dev:
"Plugin 'skammer/vim-css-color'
"Plugin 'mattn/emmet-vim'
"Plugin 'goatslacker/mango.vim'
"Plugin 'editorconfig/editorconfig-vim'
"Plugin 'bronson/vim-trailing-whitespace'
"Plugin 'junegunn/vim-easy-align'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'maksimr/vim-jsbeautify'
"Plugin 'maxbrunsfeld/vim-yankstack'
"Plugin 'tpope/vim-surround'
"Plugin 'othree/yajs.vim'
"Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'hail2u/vim-css3-syntax'
"Plugin 'cakebaker/scss-syntax.vim'
"Plugin 'othree/html5.vim'
"Plugin 'marijnh/tern_for_vim'
"Plugin 'moll/vim-node'
"Plugin 'jcfaria/Vim-R-plugin'
"Plugin 'jalvesaq/VimCom.git'
call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Buffer Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <Leader>t :enew<cr>

" Move to the next buffer
nmap <Leader>l :bnext<CR>

" Move to the previous buffer
nmap <Leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <Leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <Leader>bl :ls<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Vim-airline Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_inactive_collapse = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1    "display current buffers
let g:airline_theme = "murmur"
set laststatus=2
let g:airline#extensions#whitespace#enabled = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Vim-Marching Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:marching_enable_neocomplete = 1
"Vimlatex Suite Settings
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
"'plaintex' instead of 'tex', which results in vim-latex not being loaded.
"The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"Shortcuts for buffers
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Tagbar Settings                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-x> :TagbarToggle<CR>
"RUN sudo apt-get install exuberant-ctags to install exberant-ctags which
"tagbar needs to work.  By doing so, the line below is unnecessary.
"let g:tagbar_ctags_bin = '~/.vim/bundle/tagbar/ctags-5.8'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Deoplete Settings                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
" ref: https://gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Polyglot Settings                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:python_highlight_all = 1   " NOTE: this causes whitespaces to be
"highlighted, which is pretty irritating
let g:go_highlight_chan_whitespace_error = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Ale Settings                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

