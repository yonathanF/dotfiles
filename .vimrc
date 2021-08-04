set nocompatible
filetype off
set encoding=UTF-8
set noswapfile
set nobackup
set hidden
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes
set noshowmode
set noruler
set cursorline
set laststatus=0
set noshowcmd

" remap leader key 
let mapleader = " "
let maplocalleader = "\\"

" remap backtick
nnoremap ' `
nnoremap ` '

noremap <leader>s :w<cr>

call plug#begin('~/.vim/plugged')

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" keep it smooth
Plug 'psliwka/vim-smoothie'

" latex plugin
Plug 'lervag/vimtex'

" fzf fast search
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'

" bullet
Plug 'dkarter/bullets.vim'

" toxic shit
Plug 'neoclide/coc.nvim'

" idris 
"Plug 'idris-hackers/idris-vim'

" haskell
Plug 'neovimhaskell/haskell-vim'

" color schemes
Plug 'dylanaraps/wal.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'sainnhe/sonokai'

" marks display
Plug 'kshenoy/vim-signature'
Plug 'ap/vim-buftabline'

" wiki 
" Plug 'vimwiki/vimwiki'

" dispatch 
Plug 'tpope/vim-dispatch'

" status line
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" comments
Plug 'scrooloose/nerdcommenter'

" file list
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'ryanoasis/vim-devicons'

" syntax pair
Plug 'raimondi/delimitmate'

" writing plugin
Plug 'junegunn/goyo.vim'

" python 
"Plug 'nvie/vim-flake8'

" sneak
Plug 'justinmk/vim-sneak'

" coq 
Plug 'whonore/Coqtail'

" language pack
Plug 'sheerun/vim-polyglot'
Plug 'azidar/firrtl-syntax'
call plug#end()

filetype plugin indent on

set clipboard=unnamedplus

" syntax highlighting 
syntax on
highlight clear SignColumn
highlight SignColumn ctermbg=238
hi Folded ctermbg=238
highlight Conceal ctermbg=238

" lil terminal stuff 
set wildmenu
set showcmd
"colorscheme wal
colorscheme gruvbox
"colorscheme nord
"colorscheme iceberg
"colorscheme sonokai
set background=dark

"set termguicolors

"let g:sonokai_style ='andromeda'
"let g:nord_uniform_diff_background = 0
"let g:nord_cursor_line_number_background = 1
"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_invert_selection='0'

" search
set hlsearch
set ignorecase
set smartcase

" other misc. 
set autoindent
set confirm
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

map f <Plug>Sneak_s
map F <Plug>Sneak_S

" remap esc
map <esc> :noh<cr>

" spell check for md and tex files
au BufRead *.md setlocal spell
au BufRead *.tex setlocal spell

" delete shouldn't yank
nnoremap <leader>d "_d
vnoremap <leader>d "_d
" status line theme 
"let g:airline_theme='minimalist'

" tex settings
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_open_on_error = 0
let g:tex_IgnoredWarnings = 1
let g:tex_flavor = 'latex'
let g:vimtex_fold_enabled = 1
set conceallevel=1
let g:tex_conceal='abdmg'

" git stuff 
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gbr :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gp :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>
nnoremap <leader>gb :Gblame<CR>

" move around buffers
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>
nnoremap <C-x> :bdelete<CR>

" reload file if it has changed
au FocusGained,BufEnter * :checktime
" wiki stuff
" let g:vimwiki_list = [{'path': '~/Sync/wiki', 'syntax':'markdown', 'ext': '.markdown'}, {'path':'~/archive/vimwiki/','ext': '.markdown'}]

" sessions and fzf
nnoremap <silent> <leader><leader> :Files<CR>
let g:fzf_layout={'window' : {'width': 0.8, 'height':0.8}}
let $FZF_DEFAULT_OPTS='--reverse'
map <silent> <leader>z :Goyo \| set linebreak<CR>

nnoremap <silent> <leader>r :Ag<space> 

nnoremap <leader>d <cmd>CHADopen<cr>

"let g:Tex_MultipleCompileFormats='pdf,bib,pdf'
let g:vimtex_compiler_latexmk ={ 
      \ 'options' : [
      \   '-silent',
      \   '-synctex=0',
      \   '-interaction=nonstopmode',
      \ ]
      \} 

" quick spelling fix
imap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u<Esc>$a

" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

" ##############################################################################
" ##############################COC SETTIGNS####################################
" ##############################################################################

let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"                  
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"vmap <cr> <Plug>(coc-snippets-select)

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
"let g:coc_snippet_prev = '<c-k>'

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"let g:coc_snippet_next = '<tab>'

"" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nnoremap <silent> <leader>t :<C-u>CocCommand metals.tvp<CR>

"" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

"" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

"" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" set a default python binary
let g:python3_host_prog = '/usr/bin/python'

map  <leader>k <Plug>(coc-diagnostic-prev)
nmap  <leader>j <Plug>(coc-diagnostic-next)

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
