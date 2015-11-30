set t_Co=16 " force 16 colors in terminals

set autoindent
set autowrite
set background=light
set backspace=indent,eol,start
set backup
set backupdir=~/.vim/tmp/backup//
set cinoptions=>1s,:0,=1s,l1,b0,g0,h1s,i1s,+1s,c3,C0,/0,(0,u0,U0,w0,W0,m0,M0
set colorcolumn=+1
set cursorline
hi CursorLine term=none cterm=none ctermbg=none guibg=Grey90
set directory=~/.vim/tmp/swap//
set expandtab
set encoding=utf-8
set fileencodings=""
set foldlevel=9999
set foldmethod=manual
set laststatus=2
"set lazyredraw
set list
set listchars=tab:>-
set nocompatible
set noerrorbells
set noincsearch
set nojoinspaces
set number " line numbering in the left column
"set path=.,,,**;./
set shiftround
set shiftwidth=4
set showcmd
set showmode
set smarttab
set softtabstop=4
"set spell spelllang=en_us
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P " standard status line with ruler
set synmaxcol=400
set tags=./tags;
set tabstop=4
set textwidth=78
set title titlestring=%t%(\ %M%)%(\ (%{hostname()}:\ %{expand(\"%:p:~:h\")})%)%(\ %a%)
set ttyfast
set undodir=~/.vim/tmp/undo//
set viminfo=""
set visualbell
set wildchar=<Tab> wildmenu wildmode=full

if has("gui_running")
    hi Normal guifg=#353535 guibg=#FFFFFF
    hi Search guibg=#AA9900
    hi ErrorMsg guibg=#AA0000
    hi LineNr guifg=#CCCCCC guibg=#FFFFFF

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
    set lines=75
    set columns=115
    winpos 1920 0
endif

:autocmd!

augroup trailing
    autocmd!
    autocmd InsertEnter * :set listchars-=trail:.
    autocmd InsertLeave * :set listchars+=trail:.
augroup END

augroup line_return
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ execute 'normal! g`"zvzz' |
                \ endif
augroup END

augroup ft_c
    autocmd!
    autocmd FileType c set cindent cinoptions=>1s,:0,=1s,l1,b0,g0,h1s,i1s,+1s,c3,C0,/0,(0,u0,U0,w0,W0,m0,M0
augroup END

augroup ft_cpp
    autocmd!
    autocmd FileType cpp set cindent cinoptions=>1s,:0,=1s,l1,b0,g0,h1s,i1s,+1s,c3,C0,/0,(0,u0,U0,w0,W0,m0,M0
augroup END

augroup ft_glsl
    autocmd!
    autocmd BufRead,BufNewFile *.{vert,vert.i,frag,frag.i,geom,geom.i,glsl,glsl.i} set filetype=glsl
    autocmd FileType glsl set cindent cinoptions=>1s,:0,=1s,l1,b0,g0,h1s,i1s,+1s,c3,C0,/0,(0,u0,U0,w0,W0,m0,M0
augroup END

augroup ft_opencl
    autocmd!
    autocmd BufRead,BufNewFile *.{cl,opencl} set filetype=opencl
    autocmd FileType opencl set cindent cinoptions=>1s,:0,=1s,l1,b0,g0,h1s,i1s,+1s,c3,C0,/0,(0,u0,U0,w0,W0,m0,M0
augroup END

augroup ft_cu
    autocmd!
    autocmd BufRead,BufNewFile *.{cu,cuda} set filetype=cu
    autocmd FileType cu set cindent cinoptions=>1s,:0,=1s,l1,b0,g0,h1s,i1s,+1s,c3,C0,/0,(0,u0,U0,w0,W0,m0,M0
augroup END

augroup ft_html
    autocmd!
    autocmd FileType html set shiftwidth=2 softtabstop=2 tabstop=2
augroup END

augroup ft_css
    autocmd!
    autocmd FileType css set shiftwidth=2 softtabstop=2 tabstop=2
augroup END

augroup ft_json
    autocmd!
    autocmd BufRead,BufNewFile *.json set filetype=json
augroup END

augroup ft_md
    autocmd!
    autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
augroup END

filetype on
filetype indent on
filetype plugin on
syntax on

noremap <F1> :checktime<cr>
inoremap <F1> <esc>:checktime<cr>

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

noremap ,v :e ~/.vimrc<CR>
noremap ,s :source ~/.vimrc<CR>

nnoremap ,a :A<CR>

nnoremap <F6> :setlocal spell spelllang=en_us<CR>

if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

if (filereadable(expand("$LLVMDIR/share/clang/clang-format.py")))
    map <C-K> :pyf /opt/llvm/share/clang/clang-format.py<CR>
    imap <C-K> :pyf /opt/llvm/share/clang/clang-format.py<CR>
endif

