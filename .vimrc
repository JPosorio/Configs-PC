syntax on
set backspace=indent,eol,start
set encoding=UTF-8
set number
set exrc
set ruler
set nocompatible
set belloff=all
set signcolumn=yes
set relativenumber
set updatetime=300
set shortmess+=c
set clipboard=unnamed
set showcmd
set showmatch
set sw=2
set laststatus=2
set scrolloff=15
set bg=dark
set cursorline
set incsearch
set breakindent
set wrap
set tw=90
set wildmenu
set wildmode=longest:list,full
set nobackup
set noswapfile
set nowritebackup
set hidden
set timeoutlen=150
set cmdheight=1
set autoindent
set guifont=FiraCode_Nerd_Font:h14


call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'


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
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:indentLine_char_list = ['|']


nmap <leader>c :NERDTreeFind<ENTER>

nmap ¡ :tabn <CR>
nmap ' :tabp <CR>
nmap - :tabm + <CR>
nmap , :tabm - <CR>

nmap <leader>w :w<ENTER>
imap <Space>i <Esc>
cnoremap <Space>i <Esc>
onoremap <Space>i <Esc>
xnoremap <Space>i <Esc>
nmap <leader>a gg=G
nmap <leader>q :q<ENTER>
nmap <leader>f /
nmap <leader>l :wincmd l<ENTER>
nmap <leader>h :wincmd h<ENTER>
nmap <leader>k :wincmd k<ENTER>
nmap <leader>j :wincmd j<ENTER>
nmap <leader>b <C-v>




" ir donde esta el archivo

nmap <silent> gd <Plug>(coc-definition)

" volver donde se usa el archivo

nmap gb <C-o>


" cambiar el modo del puntero segun el modo

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let &t_SR = "\e[4 q"

" moverse en las opciones con tab

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" seleccionar opciones con enter

inoremap <silent><expr> <cr>
			\ complete_info(['selected'])['selected'] != -1 ? "\<c-y>" :
			\ "\<c-g>u\<cr>"

