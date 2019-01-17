set nocompatible
filetype off

" disable swap files
set noswapfile

" remap leader key 
let mapleader = ","

" remap backtick
nnoremap ' `
nnoremap ` '

" easy motion binding
map <Leader> <Plug>(easymotion-prefix)

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" linter++
"Plugin 'w0rp/ale'

" latex plugin
Plugin 'lervag/vimtex'

" file finder
Plugin 'ctrlp.vim'

" theme
Plugin 'dracula/vim'

Plugin 'itchyny/lightline.vim'

" autocomplete
Plugin 'davidhalter/jedi-vim'

" fast motion
Plugin 'easymotion/vim-easymotion'

" marks display
Plugin 'kshenoy/vim-signature'

" syntax
Plugin 'scrooloose/syntastic'

" comments
Plugin 'scrooloose/nerdcommenter'

" syntax pair
Plugin 'raimondi/delimitmate'

"Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'

" writing plugin
Plugin 'junegunn/goyo.vim'

" auto completion 
Plugin 'Valloric/YouCompleteMe'

" todo list 
Plugin 'aserebryakov/vim-todo-lists'

" python indenting 
Plugin 'vim-scripts/indentpython.vim'

" file dir viewer
Plugin 'scrooloose/nerdtree'

" vue syntax hilighting 
Plugin 'posva/vim-vue'

call vundle#end()
filetype plugin indent on

" not plugin stuff
set clipboard=unnamedplus

" syntax highlighting 
syntax on

" lil terminal stuff 
set hidden
set wildmenu
set showcmd

" search
set hlsearch
set ignorecase
set smartcase

" other misc. 
set autoindent
set ruler
set confirm
set visualbell
set number
set relativenumber
set shell=/bin/bash
set shiftwidth=2

" up and down for multi-line 
nnoremap j gj
nnoremap k gk

" beginning and end of line bc default is stupid 
nnoremap B ^
nnoremap E $

" remap esc
inoremap jk <esc>
inoremap <esc> <nop>

" all the tabs 
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt

" Easily create a new tab.
noremap <Leader>tN :tabnew<CR>

" Easily close a tab.
noremap <Leader>tc :tabclose<CR>

" Easily go to next tab.
noremap <Leader>tn :tabnext<CR>

" Easily go to previous tab.
noremap <Leader>tp :tabprevious<CR>

nmap <F1> :NERDTreeToggle<CR>

" tex settings
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:vimtex_view_general_viewer = 'mupdf'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

" ale -- linter settings
let g:ale_fix_on_save = 1
let b:ale_linters = ['flake8', 'pylint']
let g:ale_fixers = {
\   'python': ['yapf', 'isort', 'remove_trailing_lines', 'trim_whitespace' ],
\   'c': ['clang-format'], 'cpp':['clang-format']
\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

set laststatus=2
set noshowmode
