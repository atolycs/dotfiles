
# Unix like which command
function which() {
  Param(
    $command
  )

  Get-Command -Name $command -ErrorAction SilentlyContinue | 
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Create junction
function mkjump() {
  param (
    $link_from,
    $link_to
  )

  New-Item -Path $link_to -Type Junction -Target $link_from
  
}

# Unix like touch command

function touch() {
  param (
    [string]$Path
  )

  if ( Test-Path -Path $Path) {
    $file = $( Get-Item $Path )
    $file.LastWriteTime = Get-Time
  } else {
    New-Item -Type File -Path $Path
  }
}

# refresh PATH Environment

function refreshenv() {
    $env:PATH = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}
