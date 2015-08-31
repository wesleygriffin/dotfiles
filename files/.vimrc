set autoindent
set autowrite
set background=light
set backspace=indent,eol,start

set colorcolumn=78,98
" for vim<7 use the let lines below
"nnoremap ,H :let w:m1=matchadd('Search', '\%<98v.\%>81v', -1)<CR>
"nnoremap ,h :call clearmatches()<CR>

set cinoptions=>1s,:0,=1s,l1,b0,g0,h1s,i1s,+1s,c3,C0,/0,(0,u0,U0,w0,W0,m0,M0
set cursorline
set expandtab
"set encoding=utf-8
set fileencodings=""
set foldlevel=9999
set foldmethod=manual
set laststatus=2
set nocompatible
set noerrorbells
set noincsearch
set nojoinspaces
"set number " line numbering in the left column
"set path=.,,,**;./
set ruler
set shiftwidth=4
set showmode
set smarttab
set softtabstop=4
"set spell spelllang=en_us
set tags=./tags;
"set tabstop=4
set title titlestring=%t%(\ %M%)%(\ (%{hostname()}:\ %{expand(\"%:p:~:h\")})%)%(\ %a%)
set viminfo=""
set visualbell
set wildchar=<Tab> wildmenu wildmode=full

if has("gui_running")
    hi Normal guifg=#2E3436 guibg=#FAFAFA
    hi Search guibg=#AA9900
    hi ErrorMsg guibg=#AA0000
    hi LineNr guifg=#2E3436 guibg=#FAFAFA gui=reverse

    if has("gui_gtk2")
        set guifont=Hack\ 9
    endif
    if has("gui_win32")
        set guifont=Hack:h10
    endif
    if has("gui_mac") || has("gui_macvim")
        set guifont=Hack:h10
    endif

    set antialias
    set guioptions-=T
    set lines=74
    set columns=130
    winpos 1920 0
endif

:autocmd!

autocmd BufRead,BufNewFile *.py set textwidth=78 cinoptions=>1s,:0,=1s,l1,b0,g0,h1s,i1s,+1s,c3,C0,/0,(0,u0,U0,w0,W0,m0,M0
autocmd BufRead,BufNewFile *.h set textwidth=78 cinoptions=>1s,:0,=1s,l1,b0,g0,h1s,i1s,+1s,c3,C0,/0,(0,u0,U0,w0,W0,m0,M0
autocmd BufRead,BufNewFile *.c set textwidth=78 cinoptions=>1s,:0,=1s,l1,b0,g0,h1s,i1s,+1s,c3,C0,/0,(0,u0,U0,w0,W0,m0,M0
autocmd BufRead,BufNewFile *.hpp set textwidth=78 cinoptions=>1s,:0,=1s,l1,b0,g0,h1s,i1s,+1s,c3,C0,/0,(0,u0,U0,w0,W0,m0,M0
autocmd BufRead,BufNewFile *.cpp set textwidth=78 cinoptions=>1s,:0,=1s,l1,b0,g0,h1s,i1s,+1s,c3,C0,/0,(0,u0,U0,w0,W0,m0,M0
autocmd BufRead,BufNewFile *.cc set textwidth=78 cinoptions=>1s,:0,=1s,l1,b0,g0,h1s,i1s,+1s,c3,C0,/0,(0,u0,U0,w0,W0,m0,M0

autocmd BufRead,BufNewFile *.html set shiftwidth=2 softtabstop=2 tabstop=2
autocmd BufRead,BufNewFile *.css set shiftwidth=2 softtabstop=2 tabstop=2

filetype on
filetype indent on
filetype plugin on
syntax on

let c_no_curly_error=1

nnoremap <silent> ,, :BufExplorer<CR>
nnoremap <silent> <C-S-Tab> :bn<CR>
nnoremap <silent> <C-Tab> :bn<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

nnoremap \\t :vert stag<CR>
nnoremap \\g :vimgrep */<CR>

nnoremap \\f :C file <C-R>=findfile(expand('%:t:r'), '**')<CR>
nnoremap \\b :C break <C-R>=expand('%:p') . ':' . line('.')<CR>

noremap ,v :e $HOME/.vimrc<CR>

nnoremap ,a :A<CR>

nnoremap <F6> :setlocal spell spelllang=en_us<CR>
