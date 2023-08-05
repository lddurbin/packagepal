get_os_name <- function() {
  if(Sys.info()["sysname"] == "Windows") {
    return("Windows")
  } else if(Sys.info()["sysname"] == "Darwin") {
    return("MacOS")
  } else {
    return("Linux")
  }
}


check_for_rtools <- function() {
  if(pkgbuild::find_rtools()) {
    ui_oops("You haven't installed Rtools yet.")
  } else {
    ui_done("Congrats, you've already installed Rtools!")
  }
}


check_for_xcode <- function() {
  if(grep("/", system("xcode-select -p", intern = TRUE)) != 1) {
    install_xcode()
  } else {
    ui_done("Congrats, you've already installed XCode!")
  }
}


install_xcode <- function() {
  if(ui_yeah("You haven't installed XCode yet. Do you want to install it now?")) {
    browseURL("https://apps.apple.com/us/app/xcode/id497799835")
  } else {
    ui_done("OK, I won't download XCode right now.")
  }
}


check_for_package_development_toolchain <- function(os_name = get_os_name()) {
  if(os_name == "Windows") {
    return(check_for_rtools())
  }

  if(os_name == "MacOS") {
    return(check_for_xcode())
  }

  if(os_name == "Linux") {
    ui_oops("You seem to be using Linux. {packagepal} doesn't support Linux, but you probably don't need to use it anyway right?")
  }
}
