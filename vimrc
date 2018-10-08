" Turns off compatibility with legacy Vi
set nocompatible

filetype plugin indent on

" Don't show mode (handled by statusline plugin)
set noshowmode

" For statusline plugin to work properly with NERDTree
set laststatus=2

" Sets encoding to UTF-8
set encoding=utf-8

" Universal indent & tab size (HTML, CSS, JS...)
set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2 " number of spaces to shift left or right when shifting
set expandtab " Makes tabs become spaces

" Re-map ESC key to jk:
inoremap jk <ESC>

" Re-map leader key to spacebar
let mapleader = "<Space>"

" Autogroup to create SOME language-specific settings 
" Langauge specific configs
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" Backup Settings
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Using plugin manager ==  vim-plug
" 
" Automatic installation of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Begin plugin calls and specify installation dir
" (Avoid using standard Vim directory names like 'plugin')
" (Ex- Plug 'url/gitrepo/someplugin')
call plug#begin('~/.vim/plugged')

" Python Code-Folding
Plug 'tmhedberg/SimpylFold'

" Monokai Syntax Coloring
Plug 'crusoexia/vim-monokai'

" Proper Python indentation
Plug 'vim-scripts/indentpython.vim'

" Syntax checker
Plug 'w0rp/ale'

" NERDTree for proper file trees
Plug 'scrooloose/nerdtree'

" Search with CTRL+p
Plug 'kien/ctrlp.vim'

" Git Integration
Plug 'tpope/vim-fugitive'

" Status bar
Plug 'itchyny/lightline.vim'

" Javascript
Plug 'pangloss/vim-javascript'

" Update &runtimepath and initialize plugin system
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set lightline status bar settings
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Opens NERDTree automatically when vim starts up, even if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Opens NERDTree with CTRL + n 
map <C-n> :NERDTreeToggle<CR>

" Universal Clipboard
set clipboard=unnamedplus

" Enable code-folding
set foldenable
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Show line numbers
set number

" Show commands entered at the bottom-right
set showcmd

" Visual autocomplete for command menu
set wildmenu

" Redraw only when when really needed
set lazyredraw

" Show a visual line under the cursor's current line
set cursorline

" Show the matching part of the pair for [], {}, and ()
set showmatch

" Search as characters are entered
set incsearch

" Highlight matches
set hlsearch

" Turn off search highlight with SPACEBAR
nnoremap <leader><space> :nohlsearch<CR>

" Enable all Python syntax highlighting features
let python_highlight_all=1
syntax enable

" Syntax color scheme
colorscheme monokai

" Terminal now only supports 256-colors for vim-monokai
set t_Co=256

" Enables italic fonts for terminal and gui monokai colors
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
