function prompt {
    # --- ANSI helpers ---
    $esc   = "`e["
    $reset = "${esc}0m"

    # 256-color helpers
    function FG([int]$c) { return "${esc}38;5;${c}m" }
    function BG([int]$c) { return "${esc}48;5;${c}m" }

    # Powerline separator (NerdFont)
    $sepR = ""

    # Segment builder
    function Seg([string]$text, [int]$fg, [int]$bg, [int]$nextBg, [bool]$isLast=$false) {
        $seg  = "$(FG $fg)$(BG $bg) $text "

        if ($isLast) {
            # Reset SOLO del fondo (49m) para que el triángulo tome el color del segmento (FG = $bg)
            $seg += "${esc}49m$(FG $bg)$sepR$reset"
        } else {
            $seg += "$(FG $bg)$(BG $nextBg)$sepR"
        }
        return $seg
    }

    # --- Colors (256-color palette) ---
    $bgPath  = 24   # dark blue
    $bgGit   = 90   # dark purple
    $bgConda = 22   # dark green
    $bgPy    = 58   # subtle indigo
    $bgTime  = 238  # dark gray
    $bgBad   = 88   # red

    $fgLight = 231  # near white
    $fgWarn  = 229  # soft yellow
    $fgDim   = 250  # light gray

    # --- Icons (NerdFont) ---
    $iconFolder = ""
    $iconGit    = ""
    $iconWarn   = ""
    $iconStage  = ""   # staged marker
    $iconDirty  = ""   # dirty marker
    $iconPy     = ""   # python
    $iconClock  = ""   # clock

    # --- Data: path ---
    $path = (Get-Location).Path.Replace($HOME, "~")

    # --- Data: python env (venv/conda) ---
    $pyText = $null
    if ($env:VIRTUAL_ENV) {
        $venvName = Split-Path -Leaf $env:VIRTUAL_ENV
        if ($venvName) { $pyText = "$iconPy $venvName" }
    } elseif ($env:CONDA_DEFAULT_ENV) {
        $pyText = "🅒 $($env:CONDA_DEFAULT_ENV)"
    }

    # --- Data: git info (branch + staged/dirty flags) ---
    $gitText = $null
    $gitFg   = $fgLight

    try {
        $inside = git rev-parse --is-inside-work-tree 2>$null
        if ($inside -eq "true") {
            $branch = git branch --show-current 2>$null
            if (-not $branch) {
                $sha = git rev-parse --short HEAD 2>$null
                if ($sha) { $branch = "detached@$sha" }
            }

            # staged/dirty detection (single call)
            $porc = git status --porcelain 2>$null
            $hasStaged = $false
            $hasDirty  = $false
            if ($porc) {
                foreach ($line in $porc -split "`n") {
                    if ($line.Length -lt 2) { continue }
                    $x = $line[0]  # index
                    $y = $line[1]  # working tree
                    if ($x -ne ' ' -and $x -ne '?') { $hasStaged = $true }
                    if ($y -ne ' ') { $hasDirty = $true }
                    # untracked counts as dirty
                    if ($x -eq '?' -and $y -eq '?') { $hasDirty = $true }
                }
            }

            $suffix = ""
            if ($hasStaged) { $suffix += " $iconStage" }
            if ($hasDirty)  { $suffix += " $iconDirty" }

            if ($hasStaged -or $hasDirty) { $gitFg = $fgWarn }

            if ($branch) { $gitText = "$iconGit $branch$suffix" }
        }
    } catch {}

    # --- Data: last command duration (only if > 1s) ---
    $timeText = $null
    try {
        $h = Get-History -Count 1 -ErrorAction SilentlyContinue
        if ($h) {
            $dur = $null
            if ($h.PSObject.Properties.Match('Duration').Count -gt 0 -and $h.Duration) {
                $dur = $h.Duration
            } elseif ($h.PSObject.Properties.Match('EndExecutionTime').Count -gt 0 -and $h.EndExecutionTime) {
                $dur = ($h.EndExecutionTime - $h.StartExecutionTime)
            }
            if ($dur -and $dur.TotalSeconds -ge 1) {
                if ($dur.TotalSeconds -lt 10) {
                    $timeText = "$iconClock {0:n1}s" -f $dur.TotalSeconds
                } else {
                    $timeText = "$iconClock {0:n0}s" -f $dur.TotalSeconds
                }
            }
        }
    } catch {}

    # --- Compose segments ---
    $out = ""
    $segments = @()

    # ERR badge only when last command failed
    if (-not $?) {
        $segments += @{ text="$iconWarn ERR"; fg=$fgLight; bg=$bgBad }
    }

    if ($timeText) { $segments += @{ text=$timeText; fg=$fgDim;  bg=$bgTime } }

    if ($pyText)   { $segments += @{ text=$pyText;   fg=$fgLight; bg=$bgPy } }

    $segments += @{ text="$iconFolder $path"; fg=$fgLight; bg=$bgPath }

    if ($gitText)  { $segments += @{ text=$gitText;  fg=$gitFg;   bg=$bgGit } }

    for ($i=0; $i -lt $segments.Count; $i++) {
        $cur = $segments[$i]
        $isLast = ($i -eq $segments.Count - 1)
        $nextBg = if ($isLast) { 0 } else { $segments[$i+1].bg }

        $out += Seg -text $cur.text -fg $cur.fg -bg $cur.bg -nextBg $nextBg -isLast $isLast
    }

    $out += "$reset "
    return $out
}

# PSReadLine prediction (menos clunky)
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView