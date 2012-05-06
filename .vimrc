call pathogen#infect()
call pathogen#helptags()

if has("gui_macvim")
    let macvim_hig_shift_movement = 1
    " macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
endif

set bg=dark
colorscheme slate

set ts=2
set sts=2
set sw=2
set expandtab
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
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2,*.erb setlocal ft=html
autocmd BufNewFile,BufRead *Makefile,*.mk setlocal noexpandtab
autocmd BufNewFile,BufRead *.txt setlocal spell spelling=en_us
" Mappings
" ========

" Command-T Mappings
nnoremap <silent> <leader>t :CommandT<CR>
nnoremap <silent> <leader>b :CommandTBuffer<CR>
