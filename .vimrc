set tags=./tags,tags;

" set colorscheme
syntax enable
if has('gui_running')
    set background=dark
    colorscheme solarized
    if has("gui_gtk2")
        set guifont=Inconsolata\ 9
    endif
else
    set background=dark
    colorscheme solarized
    set t_Co=16
endif

" set line numbers
set number
" highlight current line
set cursorline

" set highlight search matches
set hlsearch

" Taglist
"nnoremap <F3> :TlistToggle<CR>
"let Tlist_Use_Right_Window = 1

" Tagbar
nnoremap <F3> :TagbarToggle<CR>
"enable mouse support
set mouse=a

" set tab settings
filetype plugin indent on
" size of a hard tabstop
set tabstop=2
" size of an "indent"
set shiftwidth=2
" always use spaces instead of tabs
set expandtab

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" set default shell to bash. other shells(fish) caused issues
set shell=bash

" display column when text goes past 80 characters per line
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" pathogen plugin manager
execute pathogen#infect()

" add filepath to statusline %F for full %f for relative path
"set statusline+=%F
" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" close error list when node left, don't open automatically
let g:syntastic_auto_loc_list = 1 "2
let g:syntastic_loc_list_height=1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_signs = 1

let g:syntastic_enable_highlighting = 1
let g:syntastic_enable_balloons = 1
" pflake8, pyflakes, pylint and a native python
let g:syntastic_python_checkers = ['pylint'] 
nnoremap <F4> :SyntasticCheck<CR>
nnoremap <F5> :SyntasticReset<CR>

"remap "jj" to escape
ino jj <esc>
ino jk <esc>
cno jj <c-c> 
" "v" toggles visual mode
vno v <esc>

