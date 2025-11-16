oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\amro.omp.json" | Invoke-Expression

Import-Module Terminal-Icons

# === PSReadLine ===
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Chord UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord DownArrow -Function HistorySearchForward

Set-PSReadLineOption -ShowToolTips

Set-PSReadLineOption -Colors @{
    Command   = 'Green'
    Parameter = 'Yellow'
    Operator  = 'Cyan'
    Variable  = 'Magenta'
    String    = 'DarkYellow'
    Number    = 'Cyan'
    Member    = 'Blue'
    Type      = 'DarkCyan'
    Comment   = 'DarkGray'
    Keyword   = 'Blue'
    Error     = 'Red'
    Default   = 'Gray'
}

Set-PSReadLineKeyHandler -Chord Ctrl+a -Function BeginningOfLine
Set-PSReadLineKeyHandler -Chord Ctrl+e -Function EndOfLine
Set-PSReadLineKeyHandler -Chord Ctrl+u -Function BackwardDeleteLine
Set-PSReadLineKeyHandler -Chord Ctrl+k -Function ForwardDeleteLine
Set-PSReadLineKeyHandler -Chord Ctrl+w -Function BackwardKillWord
Set-PSReadLineKeyHandler -Chord Alt+d -Function KillWord
Set-PSReadLineKeyHandler -Chord Alt+. -Function YankLastArg
Set-PSReadLineKeyHandler -Chord Shift+Enter -Function InsertLineBelow

# === Fzf ===
Import-Module PSFzf
Set-PsFzfOption -PreviewCommand { param($file) Get-Content $file -Head 20 }
Set-PsFzfOption `
    -PSReadlineChordProvider 'Ctrl+t' `
    -PSReadlineChordReverseHistory 'Ctrl+r' `
    -OnSelect {
      param($item)
      $item = [string]$item
      $item | Set-Clipboard
      Write-Host "Copied file path to clipboard: $item"
    }

# === Alias ===
function ll { Get-ChildItem | Format-Table Name, Length, LastWriteTime }
function la { Get-ChildItem -Force | Format-Table Name, Length, LastWriteTime }
function mkcd { param($folderName) New-Item -ItemType Directory -Name $folderName; Set-Location $folderName }
function rm { param($path) Remove-Item $path -Recurse -Force }
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function grep { param($pattern, $file) Select-String -Pattern $pattern -Path $file }
function coding { param($path) Set-Location "D:\coding\$path" }
function kuliah { param($path) Set-Location "D:\kuliah\$path" }
function d { Set-Location "D:\" }
