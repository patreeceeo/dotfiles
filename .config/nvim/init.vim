:
""" Begin: Configure Vim-Plug """
call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'patreeceeo/vim-colors-blueprint'
Plug 'vim-airline/vim-airline'
" Some day, try Shougo/denite.nvim instead of ctrlp
Plug 'ctrlpvim/ctrlp.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'elzr/vim-json'
Plug 'tpope/vim-commentary'
if match(&runtimepath, 'vim-commentary')
  nnoremap <Leader>\ :Commentary<CR>
  vnoremap <Leader>\ :Commentary<CR>
endif
Plug 'tpope/vim-surround'
Plug 'rhowardiv/nginx-vim-syntax'
Plug 'scrooloose/syntastic'
if match(&runtimepath, 'syntastic')
  let g:syntastic_mode_map={ 'mode': 'active',
                       \ 'active_filetypes': [],
                       \ 'passive_filetypes': ['html'] }

  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_typescript_checkers = ['tslint']
  let g:syntastic_typescript_tslint_args = '--fix'

  let g:syntastic_scss_checkers = ['scss-lint']

  let g:syntastic_typescript_tsc_fname = ''

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_loc_list_height = 3
endif
Plug 'tpope/vim-fugitive'
if match(&runtimepath, 'vim-fugitive')
  " rhubarb depends on fugitive
  Plug 'tpope/vim-rhubarb'
endif
Plug 'leafgarland/typescript-vim'
" The following syntax plugin doesn't get confused by
" template tags like 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mfukar/robotframework-vim'
Plug 'chrisbra/Colorizer'

" Note: VimR 0.29 crashes because of coc.nvim
" Note: Use `:CocInstall <name of language server>`
Plug 'neoclide/coc.nvim', {'branch': 'release'}
if match(&runtimepath, 'coc.nvim')
  " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

  "Close preview window when completion is done.
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
endif

call plug#end()
""" End: Configure Vim-Plug """

if match(&runtimepath, 'gruvbox')
  set termguicolors
  set background=dark
  colorscheme gruvbox
  let g:gruvbox_italic = 1
  let g:gruvbox_contrast_dark = 'soft'
endif

if match(&runtimepath, 'ctrlp.vim')
  let g:ctrlp_working_path_mode = 'ra'

  if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
  endif
endif

set ts=2
set sts=2
set sw=2
set expandtab
syntax on
set nospell
filetype on
filetype plugin indent on
set nu
set title
set wildmenu
set wildmode=list:longest,full
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
set linebreak
set nolist
set ruler
set nowrapscan
set noswapfile
set wildignore+=*.sw*,*.pyc,.git,target/*,tmp/*,dist/*,build/*,coverage/*
set iskeyword+=-
set autoread
set titlestring=%M%t
" don't automatically resize windows
set noequalalways
set shell=/bin/zsh
" Neovim Python provider
let g:python3_host_prog='/usr/local/bin/python3'

" Required for operations modifying multiple buffers like rename.
" Also required by coc.nvim?
set hidden
" Use W! to save a file as superuser
cmap W! w !sudo tee % >/dev/null

" FileType specific changes
" =========================
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2,*.erb setlocal ft=xml
autocmd BufNewFile,BufRead *Makefile,*.mk setlocal noexpandtab
autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType ruby setlocal iskeyword+=!
au FileType ruby setlocal iskeyword+=?
autocmd BufNewFile,BufRead *.html.erb setlocal filetype=html
autocmd BufNewFile,BufRead *.hbs setlocal filetype=html
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown spell
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
autocmd BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
autocmd BufWrite *.ts,*.tsx CocCommand prettier.formatFile

" Mappings
" ========

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

nnoremap <C-H>    :tabprevious<CR>
nnoremap <C-L>    :tabnext<CR>
nnoremap <S-C-H>  :tabprevious
nnoremap <S-C-L>  :tabnext
nnoremap <C-J>    :tabfirst<CR>
nnoremap <C-K>    :tablast<CR>

set foldmethod=indent
set foldlevel=99

" au WinLeave * set nocursorline nocursorcolumn
nnoremap <Leader>l :set cursorline! cursorcolumn!<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Complete menu stuff
" ===================

set completeopt=longest,menuone

" Autoselect first item
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Tell ctags to load from the current directory
set tags=.ctags

" Hide the nearly useless banner on the file explorer
let g:netrw_banner = 0
" Set size as % of current window
let g:netrw_winsize = 12
" Use tree style
let g:netrw_liststyle = 3

" don't underline mispelled words
hi SpellBad gui=none
autocmd BufNewFile,BufRead *.md hi SpellBad gui=undercurl

if has("gui_macvim")
    let macvim_hig_shift_movement = 1
    set guioptions=egmt
    set guifont=Fantasque\ Sans\ Mono:h18
    set guitablabel=%>%f%M
else
    set mouse=a
endif
