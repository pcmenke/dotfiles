set tags=./tags,tags;

" pathogen plugin manager
execute pathogen#infect()

" enable syntax highlighting
syntax enable

if (has("termguicolors"))
  set termguicolors
endif

" set colorscheme
if has('gui_running')
    let g:one_allow_italics = 1
    set background=dark
    colorscheme solarized
    if has("gui_gtk2")
        set guifont=Inconsolata\ 9
    endif
    if has("gui_gtk3")
        set guifont=Inconsolata\ 9
    endif
else
    set background=dark
    colorscheme solarized
    "set t_Co=16
endif

" set line numbers
set number
" highlight current line
set cursorline

" set highlight search matches
set hlsearch

set list
" highlight whitespace
set listchars=trail:~

" Taglist
"nnoremap <F3> :TlistToggle<CR>
"let Tlist_Use_Right_Window = 1

"NerdTree
nnoremap <F2> :NERDTreeToggle<CR>
" Tagbar
nnoremap <F3> :TagbarToggle<CR>
"enable mouse support
set mouse=a

" set tab settings
filetype plugin indent on
" size of a hard tabstop
set tabstop=4
" size of an "indent"
set shiftwidth=4
" always use spaces instead of tabs
set expandtab
" turn on nice and smart indenting, auto required by smart
set autoindent
set smartindent
" display line num, column num, etc
set ruler

autocmd FileType make setlocal noexpandtab

if has("autocmd")
    autocmd FileType make set noexpandtab
    autocmd FileType c,cpp,h,hpp,sh setlocal cc=120
    autocmd FileType python setlocal cc=80
endif

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

" add filepath to statusline %F for full %f for relative path
"set statusline+=%f
"set statusline+=\ -\   "seperator
" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" close error list when node left, don't open automatically
let g:syntastic_auto_loc_list = 1 "2
let g:syntastic_loc_list_height= 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_signs = 1

let g:syntastic_enable_highlighting = 1
let g:syntastic_enable_balloons = 1
" lget g:syntastc_python_pylint_args = '--rcfile=/path/to/my/pylintrc'
" pflake8, pyflakes, pylint and a native python
let g:syntastic_python_checkers = ['pylint', 'pydocstyle']

let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall '
let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_config_file = '.syntastic_config'
let g:syntastic_c_compiler = 'clang'
"let g_syntastic_c_config_file = '.syntastic_config'
lget g:syntastic_c_compiler_opitons = '-Wall'

nnoremap <F4> :SyntasticCheck<CR> :lopen<CR>
nnoremap <F5> :SyntasticReset<CR> :lclose<CR>

"remap "jj" to escape
ino jj <esc>
ino jk <esc>
cno jj <c-c> 
" "v" toggles visual mode
vno v <esc>

" youcomplete me
let g:ycm_python_binary_path = 'python'

