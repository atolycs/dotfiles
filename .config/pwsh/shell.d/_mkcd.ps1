function mkcd() {
  Param($Directory)

  if (!(Test-Path -Path $Directory)) {
    mkdir $Directory
  }
  cd $Directory
}
