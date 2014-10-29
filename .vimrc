"Miscellaneous Settings
set nocompatible    "Need to set nocompatible for the cool tricks in vim to work
filetype off        "Need for vundle to work
set showcmd         "Shows what you are typing out as a command
syntax on           "Allows for syntax highlighting
syntax enable
set number
colorscheme ir_black  "Set color scheme
"hi Normal ctermfg=252 ctermbg=NONE
"Set highlighting full search term on + change highlighting color to light blue
set hlsearch
"hi Search guibg=LightBlue 
set ruler           "Show the line and column number of the cursor position,
                    "separated by a comma.
set showmatch       "Shows the matching bracket that is on the cursor
set cryptmethod=blowfish "Uses a better encryption method than the default
"Tab Settings
set tabstop=4       "Changes number of spaces used for tabbing
set shiftwidth=4    "Changes number of spaces used for indentation
set expandtab       "Uses space characters when indenting"
set autoindent      "Indents next line similarily as the current one"
set smartindent     "Automatically inserts one extra level of indentation"
set showcmd         "Show normal mode keypresses at the bottom of the screen"
set confirm         "Dialog asking to confirm things instead of erroring"
set ignorecase      "This ignores case when searching for something
set smartcase       "Searches FOR case if case sensitive query is made
set incsearch       "Searches while you type!
set textwidth=79    "Maximum width of text that is being inserted. A longer
                    "line will be broken after white space to get this width
                    
"Color Column Settings
hi ColorColumn  cterm=NONE ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
"set colorcolumn=80 "Creates a bar at column 80: makes code look neat
"Evil colorcolumn setting:
""hi ColorColumn ctermbg=red ctermfg=blue
""exec 'set colorcolumn=' . join(range(2,80,3), ',')
"Column Settings
"Creates crosshaird to trac the cursor
hi CursorLine   cterm=NONE ctermbg=8
hi CursorColumn cterm=NONE ctermbg=8
set cursorline!
set cursorcolumn!
"set vpslit and split to the correct sides
set splitright
set splitbelow
"Backup Settings
set noswapfile      "NO MORE SWAP FILES!! BWHAHAHA
set backup          "Setup backup 
"backup locations: make sure they exist!
set backupdir=~/.vim/backup//
set directory=~/.vim/tmp//
"Map Settings
"Map ctrl+s to save document
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
"Spell Check Settings
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.pdf setlocal spell spelllang=en_us
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

"Vundle Settings
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'twerth/ir_black'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline-fonts'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
call vundle#end()
filetype plugin indent on
"NeoComplete Settings
"Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
"startble omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"Change background
hi Pmenu ctermbg=8
hi PmenuSel ctermbg=1
hi PmenuSbar ctermbg=0
"Vim-airline Settings
let g:airline_inactive_collapse=1
set laststatus=2
"NERDTree Settings
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>
"Tagbar Settings
map <C-b> :TagbarToggle<CR>
"Ctrlp Settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
"Neosnippet Settings
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
