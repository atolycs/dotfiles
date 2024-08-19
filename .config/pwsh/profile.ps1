
# Tab Complete Change
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -BellStyle none

# my plugin load

$baseDir = $(Join-Path $PSScriptRoot ".\shell.d")
$files = @(Get-ChildItem $baseDir -Filter *.ps1 | Where-Object { $_.FullName })

forEach ($s in $files) {
  if ( Test-Path $s ) {
    . $s
  }
}

# import PSFzf
if ( -not (Get-Module -Name PSFzf -ListAvailable) ) {
    Install-Module -Name PSFzf
    winget install --id junegunn.fzf
}

if ( -not (Get-Module -Name posh-git -ListAvailable) ) {
    Install-Module -Name posh-git
}

if ( -not (Get-Module -Name Terminal-Icons -ListAvailable) ) {
  Install-Module -Name Terminal-Icons
}

# Import Module

Import-Module posh-git
Import-Module Terminal-Icons

# Console Encode UTF-8
[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
[System.Console]::InputEncoding  = [System.Text.Encoding]::GetEncoding("utf-8")

if (Get-Command oh-my-posh -ea SilentlyContinue)
{
  $omp_config = Join-Path $PSScriptRoot ".\ohmyposh\atolycs.omp.json"
  oh-my-posh init pwsh --config $omp_config | Invoke-Expression
}

Remove-Variable baseDir
Remove-Variable files
