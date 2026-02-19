" Archivo de PLugins
" Las lineas con "" son comentarios, elimina las comillas para que sirvan
" los comados van de la forma Plug 'nombre del plugin'
" para comenzar el comando mas importante
call plug#begin('~/.vim/plugged')

"Temas, instalaremos uno primero para probar
" Para cerrar pares () {} []  ''
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'

" ------------
call plug#end()

" Comandos relacionados a Plugins
" :PlugInstall > Instala todos los Plugins aqui
" :PlugClean   > Limpia Plugins esten descargados pero no aqui (limpiar)
"
