# dotfiles

Configuraciones personales de terminal y editor para **PowerShell (Windows)** y **bash (WSL/Linux)** con estética powerline, Nerd Fonts y utilidades ligeras (fzf opcional).

---

## ✨ Qué incluye

* **PowerShell 7 prompt** (Windows)

  * Powerline minimalista (ruta, git, venv/conda, estado)
  * Sin oh‑my‑posh (inicio rápido)

* **bash prompt (WSL/Linux)**

  * Powerline coherente con PowerShell
  * Indicador WSL
  * Git staged/dirty
  * Python env (venv/conda)

* **fzf (opcional)**

  * Búsqueda difusa en historial y archivos

* **vim/neovim configs** (histórico)

---

# 🚀 Instalación rápida

## 1️⃣ Instalar Nerd Font (Windows + WSL)

Descargar una Nerd Font (recomendado: **JetBrainsMono Nerd Font**):

👉 [https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads)

Pasos:

1. Descargar `.ttf`
2. Clic derecho → **Install for all users**
3. En Windows Terminal / VSCode Terminal seleccionar:

   ```
   JetBrainsMono Nerd Font
   ```

---

# 🪟 PowerShell (Windows)

## Ubicación del perfil

```powershell
$PROFILE
```

## Activar desde dotfiles

En el perfil real de PowerShell:

```powershell
. "$HOME\Documents\FisicoFabi\dotfiles\powershell\Microsoft.PowerShell_profile.ps1"
```

---

# 🐧 bash (WSL/Linux)

## Activar prompt

Agregar en `~/.bashrc`:

```bash
source ~/Documents/FisicoFabi/dotfiles/bash/.bash_prompt
```

Recargar:

```bash
source ~/.bashrc
```

---

# 🔎 fzf (opcional pero recomendado)

Instalar:

```bash
sudo apt install -y fzf
```

Activar atajos:

```bash
source /usr/share/doc/fzf/examples/key-bindings.bash
```

## Atajos útiles

| Atajo  | Acción              |
| ------ | ------------------- |
| Ctrl+r | Buscar en historial |
| Ctrl+t | Buscar archivos     |
| Alt+c  | cd a carpeta        |

---

# 🧠 Indicadores del prompt

## Git

| Icono | Significado        |
| ----- | ------------------ |
|      | cambios staged     |
|      | cambios sin commit |

## Python

| Segmento | Significado     |
| -------- | --------------- |
|  venv   | entorno virtual |
| 🅒 conda | entorno conda   |

## Sistema

| Segmento | Significado          |
| -------- | -------------------- |
|  WSL    | shell en WSL         |
| ERR      | último comando falló |

---

# 🧰 Trucos de terminal útiles

## Historial bash

```
!!   último comando
!$   último argumento
!git último comando git
```

## Navegación

```
cd -
pushd / popd
```

---

# 📁 Estructura del repo

```
dotfiles/
  powershell/
    Microsoft.PowerShell_profile.ps1
  bash/
    .bash_prompt
  vim/
  README.md
```

---

# 🎯 Filosofía

* Estética limpia y coherente
* Inicio rápido (sin frameworks pesados)
* Configuración versionada
* Portabilidad Windows ↔ Linux

---

# 🔄 Setup en nueva máquina (1 min)

```bash
git clone https://github.com/<tu-user>/dotfiles ~/Documents/FisicoFabi/dotfiles
```

Luego seguir secciones PowerShell y bash.

---

# 📚 Referencias

* vim-plug → [https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug)
* fzf → [https://github.com/junegunn/fzf](https://github.com/junegunn/fzf)
* Nerd Fonts → [https://www.nerdfonts.com](https://www.nerdfonts.com)
