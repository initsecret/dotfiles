"
" init.vim
"
" My NeoVim config; adapted from
" https://medium.com/better-programming/setting-up-neovim-for-web-development-in-2020-d800de3efacd
" and
" https://github.com/sgmenda/dotfiles/blob/master/dot-vimrc
" 


"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------
call plug#begin("~/.vim/plugged")
  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'powershell -executionpolicy bypass -File install.ps1',
      \ }
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'morhetz/gruvbox'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'dahu/vim-fanfingtastic'
  Plug 'danilo-augusto/vim-afterglow'
  Plug 'dracula/vim', {'name':'dracula'}
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'skywind3000/gutentags_plus'
  Plug 'airblade/vim-gitgutter'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'whatyouhide/vim-gotham'
  Plug 'rhysd/vim-clang-format'
  Plug 'psf/black', { 'branch': 'stable' }
  Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'branch': 'release/0.x'
      \ }
call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

let g:python3_host_prog = "C:\\Python39\\python.EXE"
let g:deoplete#enable_at_startup = 1

autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>

" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']
" config project root markers.
let g:gutentags_project_root = ['.root']
" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')
" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
" Exclude certain file types from tag generation
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']

"-------------------------------------------------------------------------------
" Basic Config
"-------------------------------------------------------------------------------
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
if has("gui_running")
    colorscheme gruvbox
else
    colorscheme gotham
endif

set textwidth=10000

set number
set shiftwidth=4
set softtabstop=4
set expandtab

" Enable mouse
" set mouse=a

" Enable spell check
" set spell

" jj to escape insert mode
imap jj <Esc>

"-------------------------------------------------------------------------------
" Space as leader
"-------------------------------------------------------------------------------

" Space as leader
nnoremap <SPACE> <Nop>
let mapleader=" "

" select all
map <Leader>a ggVG
" edit vimrc
map <leader>v :tabnew ~\AppData\Local\nvim\init.vim<cr>
" reload vimrc when saved
" au BufWritePost .vimrc so ~/.vimrc
" save file
noremap <Leader>s :update<CR>
" select all
map <Leader>r vipgq
" save file
noremap <Leader>s :update<CR>
" " fuzzy file search
" noremap <Leader>f :Files<CR>
" ripgrep
noremap <Leader>g :Rg 
" reload init.vim
nnoremap <leader>i :source ~\AppData\Local\nvim\init.vim<CR>

"-------------------------------------------------------------------------------
" Terminal config
"-------------------------------------------------------------------------------
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"-------------------------------------------------------------------------------
" Navigating splits and trailing spaces
"-------------------------------------------------------------------------------
" Show trailing spaces
set list
" set listchars+=trail:?

" Navigating splits
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>

"-------------------------------------------------------------------------------
" FZF Config
"-------------------------------------------------------------------------------
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

"------------------------------------------------------------------------------
" From http://vim.wikia.com/wiki/Example_vimrc
"------------------------------------------------------------------------------
set wildmenu
set showcmd
set hlsearch

set ignorecase
set smartcase

set backspace=indent,eol,start
set autoindent
 
set confirm
set cmdheight=2

nnoremap <C-L> :nohl<CR><C-L>

"------------------------------------------------------------------------------
" Language server
"------------------------------------------------------------------------------
" Required for operations modifying multiple buffers like rename.
set hidden

" " Automatically start language servers.
" let g:LanguageClient_autoStart = 1
" 
" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'cpp': ['clangd', '--background-index'],
"     \ 'c': ['clangd', '--background-index'],
"     \ }

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

"------------------------------------------------------------------------------
" Tags
"------------------------------------------------------------------------------
" set statusline+=%{gutentags#statusline()}

"------------------------------------------------------------------------------
" Mozilla Stuff
"------------------------------------------------------------------------------
au BufNewFile,BufRead,BufReadPost *.jsm set syntax=javascript

