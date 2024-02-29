# Import PSFzf

if (-not (Get-Module -Name PSFzf -ListAvailable))
{
  Install-Module -Name PSFzf
  winget install --id junegunn.fzf 
  winget install --id frippery.busybox-w32
}

#Import-Module PSFzf

# Console Encode UTF-8
[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
[System.Console]::InputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")


# my plugin load

$baseDir = $(Join-path $PSScriptRoot ".\shell.d")
$files = @(Get-ChildItem $baseDir -Filter *.ps1 | Where-Object { $_.FullName })

foreach ($s in $files)
{
  if ( Test-Path $s )
  {
    . $s
  }
}

Remove-Variable baseDir
Remove-Variable files


Set-PSReadLineKeyHandler -Chord Ctrl+r -ScriptBlock {
  $command = Get-Content (Get-PSReadLineOption).HistorySavePath | busybox tac | busybox awk '!a[$0]++' | 
    Invoke-Fzf -NoSort -Exact -Prompt "History > " -Height 80%
  [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()

  if (!$command)
  {
    return
  }
  [Microsoft.Powershell.PSConsoleReadLine]::Insert($command)
}


# History Search fzf
# if (Get-Command fzf -ea SilentlyContinue) {
#   Set-PSReadLineKeyHandler -Chrod Ctrl+r -ScriptBlock {
#       $command = Get-Content (Get-PSReadlineOption).HistorySavePath |
#     }
# }

# Oh My posh setup
if (Get-Command oh-my-posh -ea SilentlyContinue)
{
  oh-my-posh init pwsh | Invoke-Expression
}

