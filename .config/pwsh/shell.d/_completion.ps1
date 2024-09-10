if (Get-Command gh -ErrorAction SilentlyContinue ) {
  Invoke-Expression -Command $(gh completion -s powershell | Out-String)
}

if (Get-Command spotify_player.exe -ErrorAction SilentlyContinue) {
    Invoke-Expression -Command $(spotify_player.exe generate powershell | Out-String)
}

if (Get-Command go-spotify-cli-windows-amd64.exe -ErrorAction SilentlyContinue) {
    Invoke-Expression -Command $(go-spotify-cli-windows-amd64.exe completion powershell | Out-String)
}

if (Get-Command oh-my-posh.exe -ErrorAction SilentlyContinue) {
    Invoke-Expression -Command $(oh-my-posh.exe completion powershell | Out-String)
}

# Winget completion

Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

# aws completion

Register-ArgumentCompleter -Native -CommandName aws -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
        $env:COMP_LINE=$wordToComplete
        if ($env:COMP_LINE.Length -lt $cursorPosition){
            $env:COMP_LINE=$env:COMP_LINE + " "
        }
        $env:COMP_POINT=$cursorPosition
        aws_completer.exe | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
        Remove-Item Env:\COMP_LINE     
        Remove-Item Env:\COMP_POINT  
}
