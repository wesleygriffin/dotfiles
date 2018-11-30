set t_Co=16 " force 16 colors in terminals

set autoindent
set autowrite
set background=light
set backspace=indent,eol,start
set backup
set backupdir=~/.vim/tmp/backup//
set colorcolumn=+2
set cursorline
hi CursorLine term=none cterm=none ctermbg=none guibg=Grey90
set directory=~/.vim/tmp/swap//
set expandtab
set encoding=utf-8
set fileencodings=""
set foldlevel=9999
set foldmethod=manual
set laststatus=2 " always on
set list " display unprintable characters
set listchars="tab:>-,trail:." " show tabs with >- and trailing spaces with .
set nocompatible
set noerrorbells
set nojoinspaces
set number " line numbers in left column
set shiftround " rounds indenting to shiftwidth on '>' and '<'
set shiftwidth=2
set showcmd
set showmode
set smarttab
set softtabstop=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P " standard status line + ruler
set synmaxcol=400 " limit number of chars searched in a single line for syntax
set tabstop=2
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
        set guifont=Hack\ 10
    endif
    if has("gui_gtk3")
        set guifont=Hack\ 10
    endif
    if has("gui_win32")
        set guifont=Hack:h10
    endif
    if has("gui_mac") || has("gui_macvim")
        set guifont=Hack:h10
    endif

    set antialias
    set guioptions-=T
    set lines=72
    set columns=130
    "winpos 1087 0
endif

filetype off

set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin('$HOME/.vim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'Valloric/YouCompleteMe'
Plugin 'joshdick/onedark.vim'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim'}
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

call vundle#end()

filetype plugin indent on
syntax on
colorscheme onedark

nnoremap <silent> ,, :BufExplorer<CR>
nnoremap <silent> <C-S-Tab> :bn<CR>
nnoremap <silent> <C-Tab> :bn<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>

nnoremap <F6> :setlocal spell spelllang=en_us<CR>

nnoremap <silent> ,a :FSHere<CR>
au! BufEnter *.h   let b:fswitchdst = 'cc,cpp'
au! BufEnter *.c   let b:fswitchdst = 'h'
au! BufEnter *.cc  let b:fswitchdst = 'h'
au! BufEnter *.cpp let b:fswitchdst = 'h'

let g:ycm_confirm_extra_conf = 0

if (filereadable(expand("$LLVM_DIR/share/clang/clang-format.py")))
    map <C-A-l> :pyf $LLVM_DIR/share/clang/clang-format.py<CR>
    imap <C-A-l> :pyf $LLVM_DIR/share/clang/clang-format.py<CR>
endif

nnoremap <silent> ,, :BufExplorer<CR>
nnoremap <silent> <C-S-Tab> :bn<CR>
nnoremap <silent> <C-Tab> :bn<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>

let g:clang_format_path=expand("$LLVM_DIR/bin/clang-format")
if (filereadable(expand("$LLVM_DIR/share/clang/clang-format.py")))
    map <C-S-l> :py3f $LLVM_DIR/share/clang/clang-format.py<CR>
    imap <C-S-l> :py3f $LLVM_DIR/share/clang/clang-format.py<CR>
endif

function! CMakeBuild()
  let s:cmd = "cmake --build build"
  silent cgetexpr system(s:cmd)
  copen
endfunction
nnoremap <F7> :call CMakeBuild()<CR>

function! CMakeConfigure()
  let s:cmd = "cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=RelWithDebInfo"
  silent cgetexpr system(s:cmd)
  copen
endfunction

