syntax on
set re=0
set backspace=indent,eol,start
set path+=**
set number
set encoding=UTF-8
set exrc
set nocompatible
set belloff=all
set relativenumber
set modifiable
set updatetime=300
set shortmess+=c
set clipboard=unnamed
set scrolloff=15
set bg=dark
set cursorline
set laststatus=2
set linebreak
set breakindent
set incsearch
set wildmenu
set wildmode=longest:list,full
set nobackup
set noswapfile
set nowritebackup
set timeoutlen=200
set textwidth=100
set wildignore+=node_modules/**,.git/**,.github/**
set lazyredraw
set foldmethod=indent
set nofoldenable
set hlsearch


call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'styled-components/vim-styled-components'

call plug#end()

colorscheme gruvbox

let mapleader=" "

let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeMapOpenInTab='<tab>'
let NERDTreeShowHidden=1
let g:indentLine_char_list = ['|']
let g:coc_disable_startup_warning = 1


nnoremap <leader>c :nohls<cr><C-L>
nnoremap <leader>s :vimgrep **/*.
nnoremap <leader>o :copen<ENTER>
nnoremap <leader>x :cclose<ENTER>
nnoremap <leader>r :%s//gc

nmap ¡ :tabn <CR>
nmap ' :tabp <CR>
nmap - :tabm + <CR>
nmap , :tabm - <CR>

nmap <leader>w :w<ENTER>
nmap <leader>t :NERDTree<ENTER>
imap <Space>i <Esc>
cnoremap <Space>i <Esc>
onoremap <Space>i <Esc>
xnoremap <Space>i <Esc>
nmap <leader>a gg=G
nmap <leader>q :q<ENTER>
nmap <leader>f /
nmap <leader>p :Files <CR>
nmap <leader>l :wincmd l<ENTER>
nmap <leader>h :wincmd h<ENTER>
nmap <leader>k :wincmd k<ENTER>
nmap <leader>j :wincmd j<ENTER>
nmap <leader>b <C-v>

let g:fzf_action = { 'enter': 'tab split' }
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'

" Evitar comentario abajo
au BufEnter * set fo-=c fo-=r fo-=o

" Ir donde se implementa
nmap gd <Plug>(coc-definition)

" Ir donde se implementa
nmap gi <Plug>(coc-implementation)

" volver donde se ejecuto el comando de go implementation
nmap gb <C-o>

" Ver en que archivos se usa
nmap gr <Plug>(coc-references)

" Ver el tipado
nmap gt <Plug>(coc-type-definition)

" Dialogo con ayuda a solucion
nmap ch <Plug>(coc-codeaction)

" Arregla lo que esta debajo del cursor
nmap cf <Plug>(coc-fix-current)

" Renombra en todos los archivos que se usa
nmap cr <Plug>(coc-rename)

" cambiar el modo del puntero segun el modo
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let &t_SR = "\e[4 q"

"usar tab y enter para seleccionar
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
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
