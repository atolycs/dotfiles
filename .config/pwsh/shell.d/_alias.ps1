# Alias

$bulk_alias_list = @(
  @{Alias="vim"; Target="nvim"};
  @{Alias="less"; Target="C:\Program Files\Git\usr\bin\less.exe"};
  @{Alias="g"; Target="git"};
  @{Alias="ll"; Target="ls"};
  @{Alias="grep"; Target="findstr"};
  @{Alias="open"; Target="Invoke-Item"};
  @{Alias=""; Target=""};
)


forEach ($register_alias in $bulk_alias_list) {
  if ($register_alias.Alias -eq "" -and $register_alias.Target -eq "") {
    break;
  }

  Set-Alias -Name $register_alias.Alias -Value $register_alias.Target
}
