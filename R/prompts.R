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
    cli::cli_alert_danger("You haven't installed Rtools yet.")
  } else {
    cli::cli_alert_success("Congrats, you've already installed Rtools!")
  }
}


check_for_xcode <- function() {
  xcode_path <- grep("/", system("xcode-select -p", intern = TRUE))

  if(xcode_path != 1) {
    cli::cli_alert_danger("You haven't installed XCode yet.")
  } else {
    cli::cli_alert_success("Congrats, you've already installed XCode!")
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
    cli::cli_alert_danger("You seem to be using Linux. {package packagepal} doesn't support Linux, but you probably don't need to use it anyway right?")
  }
}
