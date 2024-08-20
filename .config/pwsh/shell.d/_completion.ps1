if (Get-Command gh) {
  Invoke-Expression -Command $(gh completion -s powershell | Out-String)
}

if (Get-Command spotify_player.exe) {
    Invoke-Expression -Command $(spotify_player.exe generate powershell | Out-String)
}

if (Get-Command go-spotify-cli-windows-amd64.exe) {
    Invoke-Expression -Command $(go-spotify-cli-windows-amd64.exe completion powershell | Out-String)
}

if (Get-Command oh-my-posh.exe) {
    Invoke-Expression -Command $(oh-my-posh.exe completion powershell | Out-String)
}
