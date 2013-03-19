call pathogen#infect()
call pathogen#helptags()

if has("gui_macvim")
    let macvim_hig_shift_movement = 1
    " macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
    set guioptions=egmrt
endif

set bg=dark
colorscheme slate

set ts=4
set sts=4
set sw=4
set expandtab
set cursorline
syntax on
filetype on
filetype plugin indent on
set nu
set title
set wildmenu
set wildmode=full
set autoindent
set smartindent
set ignorecase
set smartcase
set smarttab
set hlsearch
set history=200
set scrolloff=4
set incsearch
set wrap
set ruler
" Use W! to save a file as superuser
cmap W! w !sudo tee % >/dev/null

" FileType specific changes
" =========================
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2,*.erb setlocal ft=xml
autocmd BufNewFile,BufRead *Makefile,*.mk setlocal noexpandtab
autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
" Mappings
" ========

" Command-T
nnoremap <silent> <leader>t :CommandT<CR>
nnoremap <silent> <leader>b :CommandTBuffer<CR>
set wildignore+=*.pyc,.git
let g:CommandTMatchWindowReverse=1
let g:CommandTCancelMap='<Esc>'

" This following was inspired by:
" http://jeetworks.org/node/89
"
" tl;dr
"
" When you get used to not using the arrow keys to move around make them do
" something else useful.

nnoremap <S-Down>    :m+<CR>
nnoremap <S-Up>      :m-2<CR>
inoremap <S-Down>    <Esc>:m+<CR>==gi
inoremap <S-Up>      <Esc>:m-2<CR>==gi
vnoremap <S-Down>    :m'>+<CR>gv=gv
vnoremap <S-Up>      :m-2<CR>gv=gv

nnoremap <S-Left>      << 
nnoremap <S-Right>     >>
inoremap <S-Left>      <Esc><<i 
inoremap <S-Right>     <Esc>>>i 
vnoremap <S-Left>      < 
vnoremap <S-Right>     > 
vnoremap <S-Tab>       >
vnoremap <S-Tab>     <

set foldmethod=indent
set foldlevel=99

map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

