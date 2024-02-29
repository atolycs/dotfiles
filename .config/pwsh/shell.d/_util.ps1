
# Unix like which command

function which() {
  Param($command)
  Get-Command $command 
  return $?
}

