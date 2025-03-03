" TODO switch to Neovim's built-in package manager
""" Begin: Configure Vim-Plug """
call plug#begin('~/.config/nvim/plugged')
Plug 'windwp/nvim-autopairs'
Plug 'github/copilot.vim'

" Copilot Chat
Plug 'zbirenbaum/copilot.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'main' }

Plug 'vim-airline/vim-airline'
Plug 'thaerkh/vim-indentguides'
Plug 'morhetz/gruvbox'
Plug 'patreeceeo/vim-colors-blueprint'
Plug 'arzg/vim-oldbook8'
" Some day, try Shougo/denite.nvim instead of ctrlp
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore='node_modules'
Plug 'tpope/vim-commentary'
if match(&runtimepath, 'vim-commentary')
  nnoremap <Leader>\ :Commentary<CR>
  vnoremap <Leader>\ :Commentary<CR>
endif
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
if match(&runtimepath, 'vim-fugitive')
  " rhubarb depends on fugitive
  Plug 'tpope/vim-rhubarb'
endif

" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
" The following syntax plugin doesn't get confused by
" template tags like 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'rhowardiv/nginx-vim-syntax'
Plug 'elixir-editors/vim-elixir'

Plug 'chrisbra/Colorizer'

" For shellcheck
Plug 'dense-analysis/ale'
let b:ale_linters = ['shellcheck']
autocmd BufNewFile,BufRead * ALEDisable
autocmd BufNewFile,BufRead *.sh ALEEnable

" Godot stuff
Plug 'neovim/nvim-lspconfig'
"A good completion plugin
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'habamax/vim-godot'
let g:godot_executable = '/home/patrick/Godot/Godot_v4.3-stable_linux.x86_64'
Plug 'mfussenegger/nvim-dap'
" End of Godot stuff

Plug 'neoclide/coc.nvim', {'branch': 'release'}
if match(&runtimepath, 'coc.nvim')
  " Some servers have issues with backup files, see #649.
  set nobackup
  set nowritebackup

  " Give more space for displaying messages.
  set cmdheight=2

  " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate
  " NOTE: There's always complete item selected by default, you may want to enable
  " no select by `"suggest.noselect": true` in your configuration file
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  " Make <CR> to accept selected completion item or notify coc.nvim to format
  " <C-g>u breaks current undo, please make your own choice
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  "Close preview window when completion is done.
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> ,g <Plug>(coc-diagnostic-prev)
  nmap <silent> .g <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <leader>nn <Plug>(coc-rename)

  " use enter key to accept autocomplete
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
endif

 Plug 'SirVer/ultisnips'
 let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

 " Trigger configuration. Do not use <tab> if you use
 " https://github.com/Valloric/YouCompleteMe.
 let g:UltiSnipsExpandTrigger='<c-bslash>'

 " shortcut to go to next position
 let g:UltiSnipsJumpForwardTrigger='<c-j>'

 " shortcut to go to previous position
 let g:UltiSnipsJumpBackwardTrigger='<c-k>'


Plug 'airblade/vim-gitgutter'
" Plug 'wuelnerdotexe/vim-astro'
Plug 'rajasegar/vim-astro'
call plug#end()
""" End: Configure Vim-Plug """

" Godot stuff
set completeopt=menu,menuone,noselect
" End of Godot stuff

if match(&runtimepath, 'vim-airline')
  let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
  let g:airline_section_b='' " don't show Git branch
  let g:airline#extensions#tabline#enabled = 0
  let g:airline#extensions#tabline#show_buffers = 1
endif


if match(&runtimepath, 'gruvbox')
  set termguicolors
  set background=dark
  colorscheme gruvbox
  " let g:gruvbox_italic = 1
  " let g:gruvbox_contrast_dark = 'soft'
endif

if match(&runtimepath, 'ctrlp.vim')
  let g:ctrlp_working_path_mode = 'ra'

  if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
  endif
endif

" if match(&runtimepath, 'neomake')
"   let g:neomake_sbt_maker = {
"         \ 'exe': 'sbt',
"         \ 'args': ['-Dsbt.log.noformat=true', 'compile'],
"         \ 'append_file': 0,
"         \ 'auto_enabled': 1,
"         \ 'output_stream': 'stdout',
"         \ 'errorformat':
"             \ '%E[%trror]\ %f:%l:\ %m,' .
"               \ '%-Z[error]\ %p^,' .
"               \ '%-C%.%#,' .
"               \ '%-G%.%#'
"        \ }
"   let g:neomake_enabled_makers = ['sbt']
"   let g:neomake_verbose=3 " Neomake on text change
"   autocmd InsertLeave,TextChanged * update | Neomake! sbt
" endif

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
set relativenumber
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
set wildignore+=*.sw*,*.pyc,.git,target/*,tmp/*,dist/*,build/*,coverage/*,node_modules/*
set iskeyword+=-
set autoread
set titlestring=%M%t
" don't automatically resize windows
set noequalalways
set shell=/bin/zsh
" Neovim Python provider
let g:python3_host_prog='/usr/bin/python3.10'
" let g:python3_host_prog=system('asdf which python')
" Automatically yank to system clipboard in addition to Vim clipboard
set clipboard+=unnamedplus

" Required for operations modifying multiple buffers like rename.
" Also required by coc.nvim?
set hidden

set secure
set exrc

" Use W! to save a file as superuser
cmap W! w !sudo tee % >/dev/null

" FileType specific changes
" =========================
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2,*.erb setlocal ft=xml
autocmd BufNewFile,BufRead *Makefile,*.mk setlocal noexpandtab
autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
au BufNewFile,BufRead *.py setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType ruby setlocal iskeyword+=!
au FileType ruby setlocal iskeyword+=?
au FileType html,css setlocal iskeyword+=-
autocmd BufNewFile,BufRead *.html.erb setlocal filetype=html
autocmd BufNewFile,BufRead *.hbs setlocal filetype=html
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown spell
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
autocmd BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
autocmd BufNewFile,BufRead *.gd setlocal autoindent noexpandtab tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.json setlocal conceallevel=0
" dirty hack
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex set filetype=eelixir
au BufRead,BufNewFile *.mdx set filetype=markdown


nnoremap <S-Left>      << 
nnoremap <S-Right>     >>
inoremap <S-Left>      <Esc><<i 
inoremap <S-Right>     <Esc>>>i 
vnoremap <S-Left>      < 
vnoremap <S-Right>     > 
vnoremap <S-Tab>       >
vnoremap <S-Tab>     <

nmap <C-H>     :tabprevious<CR>
nmap <C-L>     :tabnext<CR>
nnoremap <C-T> :tabnew<CR>
nnoremap <C-[> :w<CR>

set foldmethod=indent
set foldlevel=99

" au WinLeave * set nocursorline nocursorcolumn
nnoremap <Leader>l :set cursorline! cursorcolumn!<CR>

" nnoremap <Leader>; :CocCommand prettier.formatFile<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Complete menu stuff
" ===================

" set completeopt=longest,menuone

" Autoselect first item
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" ===================
" End Complete menu stuff

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

" So I can see my terminal background
hi Normal guibg=none

iabbrev gc-    getComponent(entity, ComponentName.)
iabbrev cc-    checkComponent(entity, ComponentName.)
iabbrev hc-    hasComponent(entity, ComponentName.)
iabbrev cl-    console.log(``)

