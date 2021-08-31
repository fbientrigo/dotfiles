" Visuales____________________________________________________
" Para que se vea mejor
  set number "mostrar numero de lineas
  set rnu "muestra numeros relativos
  set cursorline "hace higlight a la linea que estamos
  set nowrap  "hace que no hagan wrapping, osea tirar lo que sobre a la linea de abajo, puede ser molesto al programar
  syntax on "encendemos la capacidad de usar sintaxis
  "modifica la barrita, agregando inclusive un reloj, descomentar para activar
  "set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
  
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


" Source: Este apartado sirve para incluir otro archivo como init.vim
" lo que se hace es juntar un archivo de config
  source ~/AppData/Local/nvim/shortcuts.vim
  source ~/AppData/Local/nvim/plugins.vim
  source ~/AppData/Local/nvim/cocc.vim
