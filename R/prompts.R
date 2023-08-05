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
    install_toolchain("Rtools", "https://cran.r-project.org/bin/windows/Rtools/")
  } else {
    ui_done("Congrats, you've already installed Rtools!")
  }
}


check_for_xcode <- function() {
  if(grep("/", system("xcode-select -p", intern = TRUE)) != 1) {
    install_toolchain("XCode", "https://apps.apple.com/us/app/xcode/id497799835")
  } else {
    ui_done("Congrats, you've already installed XCode!")
  }
}


install_toolchain <- function(toolchain, url) {
  if(ui_yeah("You haven't installed {ui_value(toolchain)} yet. Do you want to install it now?")) {
    browseURL(url)
  } else {
    ui_done("OK, I won't download {ui_value(toolchain)} right now.")
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
