function mkcd() {
    Param($Directory)
    if (!(Test-Path -path $Directory)) {
        mkdir $Directory
      }
    cd $Directory
  }
