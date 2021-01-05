" Set compatibility to Vim only.
set nocompatible
set nolist


"Numero de Linea -------------------------------------------------
" Esto sirve para ver lineas relativas a donde estas
set rnu
" Show line numbers
set number

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Configuracion de NerdTree
autocmd StdinReadPre * let s:std_in=1
"Esto es para que vim inicie NERD si no das input
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"uncomenta lo siguiente para iniciar NERDTree cada vez
"autocmd vimenter * NERDTree

"para jedi
"set completeopt=menuone,longest,preview

"activar iconos para vim airline
let g:airline_powerline_fonts=1
let g:Powerline_symbols='unicode'
let g:airline#extensions#tabline#enabled = 1


"Configuracion para color, relacionado a nvim
:set termguicolors 
:hi Cursor guifg=green guibg=green
:hi Cursor2 guifg=red guibg=red
:set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50

"Para html :)
let g:user_emmet_leader_key=','

"Mapeos ---------------------------------------------------
"Mapeo para FZF
"El mejor mapeo de la via lactea :)
"inoremap es para mapear algo en instermode
"cnoremap para command mode

"noremap para normal mode
nnoremap <silent> <C-f> :Files<CR>
"Mapeo para NERDTree
nnoremap <silent> <C-q> :NERDTree<CR>
"Mapeo para Quitar Highlight
nnoremap <silent> <C-h> :nohl<CR>

"Escapar de modo insertar y modo comando con 
inoremap kj <esc>
cnoremap kj <esc>
inoremap <silent> <C-d> <esc>
cnoremap <silent> <C-d> <esc>

"Guardar y salir con Ctrl+s
nnoremap <silent> <C-s> :wq<CR>

"Mapeos end -----------------------------------------------


" For plug-ins to load correctly.
filetype plugin indent on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

"Usar '%' para saltar entre matching brackets, y aparte que tengan hl
set matchpairs+=<:>


" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
"Plug 'davidhalter/jedi-vim'
Plug 'mattn/emmet-vim'
"Plug 'cjrh/vim-conda'
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()



"colorscheme anderson
colorscheme desert

" Turn on syntax highlighting.
syntax on

" Configuracion de Jedi
"let g:jedi#use_tabs_not_buffers = 1
"En caso de continuar lento despues de iteraciones
"let g:pymode_rope = 0
"Que jedi utilice el entorno virtual de python dado por conda
"let $VIRTUAL_ENV = $CONDA_PREFIX


"remap para coc 
"inoremap <silent><expr> <c-space> coc#refresh()
"
"

