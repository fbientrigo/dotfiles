" Shortcuts_____________________________________________________
" Sobre salir y entrar de modos----------
  " \\ entrar en modo comando
  imap <leader><leader> <esc>:
  inoremap <silent> <C-d> <esc>
  cnoremap <silent> <C-d> <esc>
  "quitar Highlight
  nnoremap <silent> <C-h> :nohl<CR>

  " ficheros-----------------------------
  "guardar y salir con Ctrl + s
  nnoremap <silent> <C-s> :wq<CR>
  "solo salir; te dira si no guardaste los cambios
  nnoremap <silent> <C-q> :q



