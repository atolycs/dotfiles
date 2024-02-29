
# Unix like which command

function which($command)
{
  Get-Command $command -ea SilentlyContinue | Select-Object Source |
    Format-Table -HideTableHeaders
}


# Create junction
function mkjump() {
    Params($link_from, $link_to)

    New-Item -Path $link_to -Type Junction -Target $link_from
  }
