pal_start <- function() {
  check_for_package_development_toolchain()
  check_for_git()
  check_for_package("devtools")
  pal_check_git_token()
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


check_for_git <- function(os_name = get_os_name()) {
  git_check <- system("git --version", intern = TRUE)

  if(!grepl("version", git_check)) {
    pal_install_software("Git", "https://git-scm.com/downloads")
  } else {
    ui_done("Congrats, you've already installed Git!")
  }
}


pal_check_git_token <- function() {
  if(ui_yeah("Would you like to be guided through GitHub token troubleshooting and setup?")) {
    usethis::gh_token_help()
  } else {
    ui_done("OK, I won't do that right now.")
  }
}


check_for_package <- function(package) {
  if(!require(package, character.only = TRUE, quietly = TRUE)) {
    pal_install_package(package)
  } else {
    ui_done("Congrats, you've already installed {ui_value(package)}!")
  }
}


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
    pal_install_software("Rtools", "https://cran.r-project.org/bin/windows/Rtools/")
  } else {
    ui_done("Congrats, you've already installed Rtools!")
  }
}


check_for_xcode <- function() {
  if(grep("/", system("xcode-select -p", intern = TRUE)) != 1) {
    pal_install_software("XCode", "https://apps.apple.com/us/app/xcode/id497799835")
  } else {
    ui_done("Congrats, you've already installed XCode!")
  }
}


pal_install_software <- function(toolchain, url) {
  if(ui_yeah("You haven't installed {ui_value(toolchain)} yet. Do you want to install it now?")) {
    browseURL(url)
  } else {
    ui_done("OK, I won't download {ui_value(toolchain)} right now.")
  }
}


pal_install_package <- function(package) {
  if(ui_yeah("You haven't installed {ui_value(package)} yet. Do you want to install it now?")) {
    install.packages(package)
  } else {
    ui_done("OK, I won't install {ui_value(package)} right now.")
  }
}
