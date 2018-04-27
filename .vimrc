
call pathogen#infect()
call pathogen#helptags()

if has("gui_macvim")
    let macvim_hig_shift_movement = 1
    " macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
    set guioptions=egmt
    set guifont=Monaco:h16
    set guitablabel=%>%f%M
else
    set mouse=a
endif

set spell
" set bg=light

set ts=2
set sts=2
set sw=2
set expandtab
" automatically CD to directory of file being edited
" helpful with file path autocompletion
" and editing sibling files
set autochdir

syntax on
colorscheme evening
filetype on
filetype plugin indent on
set nu
set title
set wildmenu
" set wildmode=full
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
au FileType python set omnifunc=pythoncomplete#Complete
au FileType ruby setlocal iskeyword+=!
au FileType ruby setlocal iskeyword+=?
autocmd BufNewFile,BufRead *.html.erb setlocal filetype=html
autocmd BufNewFile,BufRead *.hbs setlocal filetype=html
autocmd BufNewFile,BufRead *.rb,*.rake abbreviate <buffer> pry binding.pry
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.jsx
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
autocmd BufNewFile,BufRead *.js,*.coffee,*.jsx iabbr <buffer> cl console.log
autocmd BufNewFile,BufRead *.js,*.coffee,*.jsx iabbr <buffer> cdb console.debug
autocmd BufNewFile,BufRead *.js,*.coffee,*.jsx iabbr <buffer> dbg debugger
autocmd BufNewFile,BufRead *.js,*.jsx nnoremap <leader>ja :call JSXEncloseReturn()<CR>
autocmd BufNewFile,BufRead *.js,*.jsx nnoremap <leader>ji :call JSXEachAttributeInLine()<CR>
autocmd BufNewFile,BufRead *.js,*.jsx nnoremap <leader>je :call JSXExtractPartialPrompt()<CR>
autocmd BufNewFile,BufRead *.js,*.jsx nnoremap <leader>jc :call JSXChangeTagPrompt()<CR>
autocmd BufNewFile,BufRead *.js,*.jsx nnoremap vat :call JSXSelectTag()<CR>
autocmd BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx

" vvv Just for Plume Design job
autocmd BufNewFile,BufRead .jade setlocal autoindent noexpandtab tabstop=4 shiftwidth=4

let g:markdown_fenced_languages = ['html', 'javascript', 'python']

let g:SuperTabDefaultCompletionType = "context"
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

vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>
map <leader>c :CoffeeCompile<CR>

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

if filereadable(expand('%:p:h')."/.jshintrc") 
  let g:syntastic_javascript_checkers = ['jshint']
else
  let g:syntastic_javascript_checkers = ['eslint']
endif

let g:syntastic_scss_checkers = ['scss-lint']

let g:syntastic_typescript_checkers = ['eslint', 'tslint']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set shell=/bin/zsh



" rspec mappings
map <Leader>p :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>r :call RunLastSpec()<CR>

function! RunCurrentSpecFile()
  if InSpecFile()
    let l:command = "s %"
    call SetLastSpecCommand(l:command)
    call RunSpecs(l:command)
  endif
endfunction

function! RunNearestSpec()
  if InSpecFile()
    let l:command = "s %:" . line(".")
    call SetLastSpecCommand(l:command)
    call RunSpecs(l:command)
  endif
endfunction

function! RunLastSpec()
  if exists("t:last_spec_command")
    call RunSpecs(t:last_spec_command)
  endif
endfunction

function! InSpecFile()
  return match(expand("%"), "_spec.rb$") != -1
endfunction

function! SetLastSpecCommand(command)
  let t:last_spec_command = a:command
endfunction

function! RunSpecs(command)
  execute ":w\|!" . a:command
endfunction

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

