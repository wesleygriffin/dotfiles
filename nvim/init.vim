set autowrite
set colorcolumn=+2
set cursorline
set expandtab
set listchars="tab:>-,trail:."
set noequalalways
set noincsearch
set number
set shiftwidth=2
set softtabstop=2
set tabstop=2
set textwidth=78
set title titlestring=%t%(\ %M%)%(\ (%{hostname()}:\ %{expand(\"%:p:~:h\")})%)%(\ %a%)

if has("gui")
  set guifont=Hack:h10
  set lines=75
  set columns=100
endif " gui

if has("win32")
  let g:python3_host_prog='~/AppData/Local/Programs/Python/Python37_64/python.exe'
endif " win32

if has("win32")
  call plug#begin('~/AppData/Local/nvim')
else
  call plug#begin()
endif " win32

Plug 'joshdick/onedark.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'

Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'prabirshrestha/asyncomplete.vim'

call plug#end()
colorscheme onedark

let mapleader = ','

nnoremap <silent> <Leader>a :FSHere<cr>
nnoremap <Leader>q :copen<cr>
nnoremap <Leader>t :20split term://bash<cr>
nnoremap <Leader>f :Files<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>l :Lines<cr>
nnoremap <Leader>1 :1b<cr>
nnoremap <Leader>2 :2b<cr>
nnoremap <Leader>3 :3b<cr>
nnoremap <Leader>4 :4b<cr>
nnoremap <Leader>5 :5b<cr>
nnoremap <Leader>6 :6b<cr>
nnoremap <Leader>7 :7b<cr>
nnoremap <Leader>8 :8b<cr>
nnoremap <Leader>9 :9b<cr>

nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gp :Gpush<cr>

nnoremap <ESC><ESC> :nohlsearch<cr>
nnoremap <F12> :LspDefinition<cr>
nnoremap <silent> <F7> :make!<cr> :cwindow<cr>

tnoremap <ESC><ESC> <C-\><C-n>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

augroup FSwitch
  autocmd!
  autocmd! BufEnter *.h let b:fswitchdst = 'cc,cpp,c'
  autocmd! BufEnter *.c let b:fswitchdst = 'h'
  autocmd! BufEnter *.cc let b:fswitchdst = 'h'
  autocmd! BufEnter *.cpp let b:fswitchdst = 'h,hpp'
augroup End " FSwitch

let g:clang_format_path=expand("$LLVM_DIR/bin/clang-format")
if (filereadable(expand("$LLVM_DIR/share/clang/clang-format.py")))
  map <C-S-l> :py3f $LLVM_DIR/share/clang/clang-format.py<cr>
  imap <C-S-l> :py3f $LLVM_DIR/share/clang/clang-format.py<cr>
endif " clang-format

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

function! FormatJson()
  execute '%!python -m json.tool' | w
endfunction " FormatJson

if executable('cquery')
  autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'cquery',
    \ 'cmd': {server_info->['cquery']},
    \ 'initialization_options': {
      \ 'cacheDirectory': '/tmp/wng2/cquery/cache',
      \ 'highlight': {'enabled': v:true},
      \ 'emitInactiveRegions': v:true,
    \ },
    \ 'whitelist': ['c', 'cpp', 'cc'],
    \ })
endif " cquery

set makeprg=ninja\ -C\ build

highlight LspCxxHlSymVariableStatic cterm=bold ctermfg=203
highlight LspCxxHlSymClassFunctionStatic ctermfg=251
highlight LspCxxHlSymProperty ctermfg=251
highlight LspCxxHlSymVariable ctermfg=203
highlight LspCxxHlSymField ctermfg=213
highlight LspCxxHlSym ctermfg=251

let g:airline_section_error = ''
let g:airline_section_warning = ''

let g:fzf_history_dir = '~/.local/share/fzf-history'

