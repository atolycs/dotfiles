# Alias

$bulk_alias_list = @(
  @{Alias="vim"; Target="nvim"};
  @{Alias="less"; Target="C:\Program Files\Git\usr\bin\less.exe"};
  @{Alias="g"; Target="git"};
  @{Alias="l"; Target="ls"};
  @{Alias="ll"; Target="ls"};
  @{Alias="grep"; Target="findstr"};
  @{Alias="open"; Target="Invoke-Item"};
  @{Alias="c"; Target="cd"}
)


forEach ($register_alias in $bulk_alias_list) {
  Set-Alias -Name $register_alias.Alias -Value $register_alias.Target
}
