
# Unix like which command
function which() {
  Param(
    [System.String]$command
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
    
    Write-Output "Reloading PATH Environment..."

    # Thank you GitHub Copilot !

    # Github copilot generate start
    
    # set Sepalate
    $sep = ";"
    
    # Get System PATH Environment
    $systemPath = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
    
    # Get User PATH Environment
    $userPath = [System.Environment]::GetEnvironmentVariable("Path", "User")

    # Get Process PATH Environment
    $processPath = [System.Environment]::GetEnvironmentVariable("Path", "Process")

    # Join System User PATH Environment and unique to array
    $basePathArr = @()
    if ($systemPath) { $basePathArr += $systemPath -split [regex]::Escape($sep) }
    if ($userPath) { $basePathArr += $userPath -split [regex]::Escape($sep) }

    $basePathArr = $basePathArr | Where-Object { $_ -ne "" } | Select-Object -unique

    # Process PATH Environment to array
    $processPathArr = @()
    if ($processPath) { $processPathArr += $processPath -split [regex]::Escape($sep) }
    $processPathArr = $processPathArr | Where-Object { $_ -ne "" }

    # Get Added PATH
    $addedPaths = $processPathArr | Where-Object { $_ -and ( $_ -notin $basePathArr ) } | Select-Object -Unique

    # Sync PATH
    $newPathArr = @()
    foreach ($p in ($basePathArr + $addedPaths)) {
      if ( $p -and ($newPathArr -notcontains $p) ) { $newPathArr += $p }
    }
    $newPath = $newPathArr -join $sep

    # Set Process Environment PATH
    [System.Environment]::SetEnvironmentVariable("Path", $newPath, "Process")

    # Github copilot generate end


    #$env:PATH = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

function realpath() {
    param (
      [string]$Path
    )

    [System.IO.Path]::GetFullPath((Join-Path $pwd $Path))
}
