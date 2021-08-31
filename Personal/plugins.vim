" Shortcuts que provengan de Plugins
  " Identifica el Plugins; Describe el Shortcut
  " Mapeo para instalar Plugins
  nnoremap <C-p> :PlugInstall<CR>
  " NerdTree; abrir NerdTree
  nnoremap <C-n> :NERDTree<CR>

  " Instalar Plugins Aqui ___________________________
call plug#begin('~/.vim/plugged')

" Para cerrar pares () {} []  ''
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
" Fuzzy Finder; Super rapido, para hallar archivos
" NerdTree; para buscar archivos
  Plug 'preservim/nerdtree'
  "Instalar COC, para completicion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}





"------------
call plug#end()

" Configuracion de Plugins; ayudara con el comportamiento
"
" Plugins Ficheros -------------------------------------------------
" NerdTree; configura para que
" $ nvim 
" sin archivo de entrada, abra NerdTree
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif



" Plugins Visualez -------------------------------------------------
"Configuracion para color, relacionado a nvim
" esto es mas un tema base que cambie un poco la Powershell
  :set termguicolors 




" Instrucciones de Uso
" :PlugInstall "Instalara todos los Plugins en tu fichero de plugins
"
