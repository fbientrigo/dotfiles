" Este init.vim esta creado y pensado para su uso con VSCode, por tanto varias
" cosas como lo son visuales; numeros de linea, et cetera, ceran omitidas
" Visuales____________________________________________________
" Para que se vea mejor
  set cursorline "hace higlight a la linea que estamos
  
" Utiles
   set tabstop=2 "para tener tabs no tan exagerados
  set shiftwidth=2 "size para indentar
	set smartindent
	set expandtab "convierte tabs en espacios
  "relacionados a scrolling
  set scrolloff=5 "muestro 5 lineas arriba o abajo cuando bajes con el cursor
  set ttyfast "scroll mas rapido en vim
  "relacionados a match de palabras
  set hlsearch "muestra highlight de lo que se relaciona
  set ignorecase "al buscar ignora diferencias entre mayusculas y minusculas, muy util
  set smartcase " si buscamos mayusculas, es que sabemos lo que buscamos, en ese caso hara lo inteligente y deseado

	
" Shortcuts_____________________________________________________
" Para VsCode, los mappings de insert-mode no sirven o no le hacen sentido
" por tanto todo mapping debera ser definido allo; mientras que aqui puede
" guardarse tu documentacion para estos shortcuts;
" ergo: todo comando imap, inoremap, es inutil
" Sobre salir y entrar de modos----------
  " \\ entrar en modo comando
  " salir de modoo insertar o comando con Ctrl + D
  cnoremap <silent> <C-d> <esc>
  "quitar Highlight
  "nnoremap <silent> <C-h> :nohl<CR>

" Source: Este apartado sirve para incluir otro archivo como init.vim
" lo que se hace es juntar un archivo de config
  source ~/AppData/Local/nvim/dotfiles/VSC/plugins.vim
