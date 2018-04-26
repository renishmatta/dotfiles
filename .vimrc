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
"colorscheme ir_black  "Set color scheme
"colorscheme desert  "Set color scheme
"hi Normal ctermfg=252 ctermbg=NONE
"Set highlighting full search term on + change highlighting color to light blue
set hlsearch
hi Search cterm=NONE ctermfg=grey ctermbg=blue
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
set textwidth=79    "Maximum width of text that is being inserted. A longer
                "line will be broken after white space to get this width
set encoding=utf-8
set scrolloff=3
set mouse=a         "Allow mouse use in files opened by vim
set showmode
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
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
"Automatically add braces!
inoremap { {<CR><BS>}<Esc>ko
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
"                       Highlighting Settings                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:python_highlight_all = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Vundle Settings                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'twerth/ir_black'
"Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
"Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline-fonts'
"Plugin 'ervandew/eclim'
Plugin 'Rip-Rip/clang_complete'
"Plugin 'SirVer/ultisnips'
"Plugin 'Raimondi/delimitMate'
"Plugin 'ujihisa/neco-look'  "autocomplete english words
"Plugin 'vim-scripts/HTML-AutoCloseTag'
"Plugin 'wlangstroth/vim-racket'
Plugin 'osyo-manga/vim-marching'
"Plugin 'mbbill/undotree'
"Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
"Plugin 'gerw/vim-latex-suite'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neosnippet-snippets'
"Plugin 'Shougo/vimproc.vim'
"Plugin 'fatih/vim-go'
"for web dev:
"Plugin 'skammer/vim-css-color'
"Plugin 'mattn/emmet-vim'
"Plugin 'goatslacker/mango.vim'
Plugin 'airblade/vim-gitgutter'
"Plugin 'editorconfig/editorconfig-vim'
Plugin 'bronson/vim-trailing-whitespace'
"Plugin 'junegunn/vim-easy-align'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'maksimr/vim-jsbeautify'
"Plugin 'maxbrunsfeld/vim-yankstack'
"Plugin 'tpope/vim-surround'
Plugin 'elzr/vim-json'
"Plugin 'othree/yajs.vim'
"Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'hail2u/vim-css3-syntax'
"Plugin 'cakebaker/scss-syntax.vim'
"Plugin 'othree/html5.vim'
"Plugin 'marijnh/tern_for_vim'
"Plugin 'moll/vim-node'
"Plugin 'syngan/vim-vimlint'
Plugin 'ynkdir/vim-vimlparser'
Plugin 'sheerun/vim-polyglot'
"Plugin 'jcfaria/Vim-R-plugin'
"Plugin 'jalvesaq/VimCom.git'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      NeoComplete Settings                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
"Force overwrite of completefunc
let g:neocomplete#force_overwrite_completefunc = 1
" Enable heavy omni completion.
"Neocomplete sources
if !exists('g:neocomplete#sources#omni#functions')
let g:neocomplete#sources#omni#functions = {}
endif
if !exists('g:neocomplete#sources#omni#input_patterns')
let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
let g:neocomplete#force_omni_input_patterns = {}
endif
" Java
"let g:EclimCompletionMethod = 'omnifunc'
"let g:neocomplete#force_omni_input_patterns.java =
"\ '\%(\h\w*\|)\)\.\w*'
"let g:EclimLoggingDisabled = 1
"let g:EclimTempFilesEnable = 0
"nnoremap <silent> <leader>o :JavaImportOrganize<cr>
" C & C++
let g:neocomplete#force_omni_input_patterns.c =
\ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
\ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.objc =
\ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.objcpp =
\ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
"Change background
hi Pmenu ctermbg=8
hi PmenuSel ctermbg=1
hi PmenuSbar ctermbg=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Vim-airline Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_inactive_collapse = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1    "display current buffers
let g:airline_theme = "murmur"
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       NERDTree Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>
"Tagbar Settings
map <C-b> :TagbarToggle<CR>
"Ctrlp Settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Neosnippet Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
"                       Emmet Settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Vim-CSS-Color Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:cssColorVimDoNotMessMyUpdatetime = 1


" [> NERDTree <]
" ignored files
let g:NERDTreeIgnore=['\.swp$', '\~$']

" [> NERDCommenter <]

noremap <c-_> :call NERDComment(0, "Toggle")<cr>


" [> EditorConfig <]

" to avoid issues with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']


" [> Syntastic <]

"" Syntax checkers

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_html_checkers=['tidy']
let g:syntastic_vim_checkers=['vimlint']
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_yaml_checkers=['js-yaml']
let g:syntastic_scss_checkers=['scss-lint']
let g:syntastic_css_checkers=['csslint']
let g:syntastic_handlebars_checkers=['handlebars']
let g:syntastic_tpl_checkers=['handlebars']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" get available js linters
function! GetJslinters()
    let l:linters = [ ['eslint', '.eslintrc'], ['jshint', '.jshintrc'] ]
    let l:available = []
    for l:linter in l:linters
       if executable(l:linter[0])
            call add(l:available, l:linter)
       endif
    endfor
    return l:available
endfunction

" check if the path to see if a linter config is present
function! Jslinter(path, linters)
    let l:dir = fnamemodify(a:path, ':p:h')

    if(l:dir == '/')
        return ''
    endif

    for l:linter in a:linters
        if filereadable(l:dir . '/' . l:linter[1])
            return l:linter[0]
        endif
    endfor

    return Jslinter(fnamemodify(l:dir, ':h'), a:linters)
endfunction

" set the jslinter into Syntastic
function! SyntasticSetJsLinter()

    let l:availableLinters = GetJslinters()

    " look for linter config in the current folder
    let l:jslinter = Jslinter(expand('%:p'), l:availableLinters)
    if l:jslinter == ''
        " otherwise look into the home dir
        let l:jslinter = Jslinter($HOME, l:availableLinters)
    endif

    " configure the linter
    if l:jslinter != ''
        let g:syntastic_javascript_checkers=[l:jslinter]
    endif
endfunction

call SyntasticSetJsLinter()

" [> EasyAlign <]

" select paragraph and start easyalign on the left
nnoremap <leader>a vip<Plug>(EasyAlign)<cr>

" Start interactive align to the right
vmap <leader>a <Plug>(EasyAlign)<cr><right>

let g:easy_align_ignore_groups = ['Comment']


" [> multiple cursor <]

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<esc>'


" [> JsBeautify <]

" format selection
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer>  <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" format the whole file
autocmd FileType javascript nnoremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json nnoremap <buffer>  <c-f> :call JsonBeautify()<cr>
autocmd FileType html nnoremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css nnoremap <buffer> <c-f> :call CSSBeautify()<cr>

" [> YankStack <]

nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste


" [> Javascript libraries syntax <]

let g:used_javascript_libs = 'jquery,underscore,requirejs,chai,handlebars'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            vim-go                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

