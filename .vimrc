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

" set highlight search matches
set hlsearch

" Taglist
nnoremap <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1

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
