" Use the Solarized Dark theme
set background=dark
colorscheme solarized
let g:solarized_termtrans=1

" use 256 colors in terminal
if !has("gui_running")
    set t_Co=256
    set term=screen-256color
endif

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
let mapleader=","
" Open new tab
map <leader>t :tabnew<CR>
" Open NerdTree
map <leader>n :NERDTreeToggle<CR>
" no directory arrows
let g:NERDTreeDirArrows=0

" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=4
set expandtab               " Use spaces, not tabs, for autoindent/tab key.

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
#don't like list for now
#set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set noshowmode              " Hide the default mode text e.g. -- INSERT -- below the statusline

" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
    set relativenumber
    au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " Treat .md files as Markdown
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
    " two space indent for yaml
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
endif

" https://github.com/junegunn/vim-plug
" Reload .vimrc and :PlugInstall to install plugins.
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline-themes'
Plug 'nvie/vim-flake8'
"Plug 'tpope/vim-sensible'
"Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-vinegar'
"Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-unimpaired'
"Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdtree'
"Plug 'ctrlpvim/ctrlp.vim'
"if v:version < 705 && !has('patch-7.4.785')
"  Plug 'vim-scripts/PreserveNoEOL'
"endif
"Plug 'editorconfig/editorconfig-vim'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'pangloss/vim-javascript', {'for': 'javascript'}
"Plug 'mhinz/vim-signify'
"Plug 'mattn/emmet-vim'
"Plug 'mustache/vim-mustache-handlebars'
"Plug 'chase/vim-ansible-yaml'
"Plug 'wavded/vim-stylus'
"Plug 'klen/python-mode', {'for': 'python'}
"Plug 'terryma/vim-multiple-cursors'
"Plug 'wting/rust.vim', {'for': 'rust'}
"Plug 'vim-scripts/dbext.vim'
"Plug 'krisajenkins/vim-pipe'
"Plug 'krisajenkins/vim-postgresql-syntax'
"Plug 'mileszs/ack.vim'
call plug#end()
