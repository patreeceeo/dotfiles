
""" Begin: Configure Vim-Plug """
call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
if match(&runtimepath, 'gruvbox')
  colorscheme gruvbox
endif
"Plug 'patreeceeo/vim-colors-blueprint'
Plug 'vim-airline/vim-airline'
" Some day, try Shougo/denite.nvim instead of ctrlp
Plug 'ctrlpvim/ctrlp.vim'
if match(&runtimepath, 'ctrlp.vim')
  let g:ctrlp_working_path_mode = 'ra'

  if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
  endif
endif
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'elzr/vim-json'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'rhowardiv/nginx-vim-syntax'
Plug 'scrooloose/syntastic'
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


set ts=2
set sts=2
set sw=2
set expandtab
" automatically CD to directory of file being edited
" helpful with file path autocompletion
" and editing sibling files
" set autochdir

syntax on
set nospell
set background=dark
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
autocmd BufNewFile,BufRead *.rb,*.rake abbreviate <buffer> pry binding.pry
autocmd FileType python set omnifunc=python3complete#Complete
autocmd BufNewFile,BufRead *.js setlocal filetype=javascript omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript omnifunc=javascriptcomplete#CompleteJS
" vvv for some reason checking doesn't happen right away without this
autocmd BufWritePre *.ts,*.tsx SyntasticCheck
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown spell
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
autocmd BufNewFile,BufRead *.js,*.jsx nnoremap <leader>ja :call JSXEncloseReturn()<CR>
autocmd BufNewFile,BufRead *.js,*.jsx nnoremap <leader>ji :call JSXEachAttributeInLine()<CR>
autocmd BufNewFile,BufRead *.js,*.jsx nnoremap <leader>je :call JSXExtractPartialPrompt()<CR>
autocmd BufNewFile,BufRead *.js,*.jsx vnoremap <leader>je :call JSXExtractPartialPrompt()<CR>
autocmd BufNewFile,BufRead *.js,*.jsx nnoremap <leader>jc :call JSXChangeTagPrompt()<CR>
autocmd BufNewFile,BufRead *.js,*.jsx nnoremap vat :call JSXSelectTag()<CR>
autocmd BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx

autocmd FileType html
       \ call deoplete#custom#buffer_option('auto_complete', v:false)

let g:markdown_fenced_languages = ['html', 'javascript', 'python']

" Mappings
" ========

set wildignore+=*.sw*,*.pyc,.git,target/*,tmp/*,dist/*,build/*,coverage/*

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

" vim-commentary
nnoremap <Leader>\ :Commentary<CR>
vnoremap <Leader>\ :Commentary<CR>

set foldmethod=indent
set foldlevel=99

" au WinLeave * set nocursorline nocursorcolumn
:nnoremap <Leader>l :set cursorline! cursorcolumn!<CR>

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
:au FocusLost * :set number
:au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

set autoread
" autocmd BufNewFile,BufRead *.ts,*.tsx nnoremap <Leader>f ! tslint --fix % >/dev/null<CR>
au VimEnter *.ts,*.tsx autocmd BufWritePost *.ts,*.tsx :checktime

" :nnoremap <Leader>f :

set titlestring=%M%t

cabbr erc e ~/.vimrc
cabbr ezrc e ~/.zshrc
cabbr <expr> %% expand('%:p:h')

function! SetTabWidth (tw)
  echo 'tabwidth:'
  let new_tw=str2nr(a:tw)
  echo new_tw
  set shiftwidth={new_tw}
  set tabstop={new_tw}
  set softtabstop={new_tw}
endfunction

command! -nargs=1 SetTabWidth call SetTabWidth(<f-args>)

" function! GoToCode (projname)
"   echo a:projname
"   cd $HOME."/codez/"
"   cd ${a:projname}
" endfunction

" command! -nargs=1 Code call GoToCode(<f-args>)

" Consider dashes (-) part of words
set iskeyword+=-

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

set shell=/bin/zsh


command! -nargs=? EFC call EditFilesContaining(<q-args>)

function! EditFilesContaining(pattern)
  let files=split(system("ag -l --nocolor ".a:pattern))
  echom "Editing the first 20 results"
  for file in files[0:20]
    execute("tabedit ".file)
  endfor
endfunction

" autocmd BufRead * CommandTFlush

" Use JSX hilighting in javascript files
let g:jsx_ext_required = 0


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

" OmniSharp-Roslyn C# auto-completion
" ===================================
let g:OmniSharp_server_type = 'roslyn'
" let g:OmniSharp_server_path = '/Library/Frameworks/Mono.framework/Commands/mono-sgen64 /Users/Shared/OmniSharp/omnisharp/OmniSharp.exe'
let g:OmniSharp_server_path = '/Users/Shared/OmniSharp/omnisharp/OmniSharp.exe'
let g:OmniSharp_server_use_mono = 1
" let g:OmniSharp_timeout = 5
" let g:omnisharp_proc_debug = 1

" OmniSharp-server (legacy) C# auto-completion
" ============================================
" let g:OmniSharp_server_type = 'v1'
" let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" let g:OmniSharp_server_path = '/Library/Frameworks/Mono.framework/Commands/mono-sgen64 /Users/patrick/codez/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe'

let g:Omnisharp_start_server = 1
augroup omnisharp_commands
    autocmd!

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <buffer> <F5> :wa!<CR>:OmniSharpBuild<CR>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <buffer> <Leader>b :wa!<CR>:OmniSharpBuildAsync<CR>
    " Automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    " Cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <buffer> <Leader>x  :OmniSharpFixIssue<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
  augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <Leader>rl :OmniSharpReloadSolution<CR>
nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
" Load the current .cs file to the nearest project
nnoremap <Leader>tp :OmniSharpAddToProject<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Add syntax highlighting for types and interfaces
nnoremap <Leader>th :OmniSharpHighlightTypes<CR>

"Super tab settings
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1


""" Styling for JSX Typescript
" " dark red
" hi tsxTagName guifg=#E06C75

" " orange
" hi tsxCloseString guifg=#F99575
" hi tsxCloseTag guifg=#F99575
" hi tsxAttributeBraces guifg=#F99575
" hi tsxEqual guifg=#F99575

" " yellow
" hi tsxAttrib guifg=#F8BD7F cterm=italic

" light blue
hi tsxTagName guifg=#59ACE5
" dark blue
hi tsxCloseString guifg=#2974a1
hi tsxCloseTag guifg=#2974a1
hi tsxAttributeBraces guifg=#2974a1
hi tsxEqual guifg=#2974a1
" green
hi tsxAttrib guifg=#1BD1C1

" Tell ctags to load from the current directory
set tags=.ctags

" Hide the nearly useless banner on the file explorer
let g:netrw_banner = 0
" Open files in previous window
" let g:netrw_browse_split = 4
" Set size as % of current window
let g:netrw_winsize = 12
" Use tree style
let g:netrw_liststyle = 3

" don't underline mispelled words
hi SpellBad gui=none
autocmd BufNewFile,BufRead *.md hi SpellBad gui=undercurl

" don't automatically resize windows
set noequalalways

" Required for operations modifying multiple buffers like rename.
" Also required by coc.nvim?
set hidden

" Neovim Python provider
let g:python3_host_prog='/usr/local/bin/python3'

if has("gui_macvim")
    let macvim_hig_shift_movement = 1
    set guioptions=egmt
    set guifont=Fantasque\ Sans\ Mono:h18
    set guitablabel=%>%f%M
else
    set mouse=a
endif
