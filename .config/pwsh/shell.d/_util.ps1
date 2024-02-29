
# Unix like which command

function which($command)
{
  Get-Command $command -ea SilentlyContinue | Select-Object Source |
    Format-Table -HideTableHeaders
}
