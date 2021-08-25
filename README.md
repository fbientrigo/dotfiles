[Aprende a instalar neoveim](https://www.youtube.com/channel/UCrT4HAZk3llYywwqhtfHeDw)

## Comandos de instalacion usados

#### Windows 10 Powershell
Para instalar vimplugin en Windows 10, corre el siguiente comando en la consola Powershell con permisos de anim
  ```powershell
  iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
  ni $HOME/vimfiles/autoload/plug.vim -Force
  ```

# dotfiles
  > Vainilla // contiene los archivos para el video, para lograr la configuracion mas basica
  >

Lo que seguira es el como crear
## Que plugins lleva?
    vimplug (manager de plugins):
    emmet: plugin para escribir rapido html
    air-line: cambia la UI de vim dandole colores y mas informacion

## Sobre vimrc
El archivo vimrc ya no existe aqui, utilizaremos init.vim en su lugar; la configuracion es equivalente
aqui puedes ver mi video antiguo de como funciona este archivo de configuracion mas en profundidad
asi como algunas configuraciones utiles; este video te ayudara a crear o modificar un archivo existente
o crear tu propio de manera mas personalizada
https://www.youtube.com/watch?v=16DcEP-wc7c

## Referencias
[vim-plug](https://github.com/junegunn/vim-plug)
