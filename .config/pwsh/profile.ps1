# Import PSFzf

if (-not (Get-Module -Name PSFzf -ListAvailable))
{
  Install-Module -Name PSFzf
  winget install --id junegunn.fzf
  winget install --id frippery.busybox-w32
}

if (-not (Get-Module -Name posh-git -ListAvailable)) {
  Install-Module -Name posh-git
}

if (-not (Get-Module -Name Terminal-Icons -ListAvailable)){
    Install-Module -Name Terminal-Icons
  }

#Import-Module PSFzf
Import-Module posh-git
Import-Module Terminal-Icons

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


# starship setup
# if (Get-Command starship -ea SilentlyContinue)
# {
#   function Invoke-Starship-PreCommand ($prompt)
#   {
#     $host.ui.RawUI.WindowTitle = "$env:USERNAME@$env:COMPUTERNAME`: $pwd` "
#   }
#
#
#   $env:STARSHIP_CONFIG = Join-Path $PSScriptRoot ".\starship\starship.toml"
#   Invoke-Expression (&starship init powershell)
# }

# Oh My posh setup
if (Get-Command oh-my-posh -ea SilentlyContinue)
{
  $omp_config = Join-Path $PSScriptRoot ".\ohmyposh\atolycs.omp.json"
  oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression
  #oh-my-posh --init --shell pwsh --config "spaceship.omp.json" | Invoke-Expression
}

