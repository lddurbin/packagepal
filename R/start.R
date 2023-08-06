#' Package Prerequisites
#'
#' @description Check for package development toolchains, Git, {devtools}, and
#'   (optionally) run a Git token check.
#'
#' @param install_missing_packages Install missing packages automatically?
#'   Defaults to {FALSE}.
#'
#'
#' @return Each check is called for its side-effect, returned as a message to
#'   the console.
#'
#' @export
pal_start <- function(install_missing_packages = FALSE) {
  check_for_package_development_toolchain()
  ui_info("Check if you have Git installed by running 'git --version' in the Terminal. If you don't, browse to https://git-scm.com/downloads")
  check_for_package("devtools", install_missing_packages)

  ui_info("You can check your GitHub token status with {ui_code('usethis::gh_token_help()')}")
  ui_info("When you're ready, you can call {ui_code('available()')} or go straight to {ui_code('usethis::create_package()')} to continue.")
}


#' Are Package Development Toolchains Installed?
#'
#' @param os_name The name of the user's Operating System.
#'
#' @return A side-effect of either {ui_oops}, {ui_done}, or {ui_yeah}, returned
#'   as a message to the console.
#'
#' @noRd
check_for_package_development_toolchain <- function(os_name = get_os_name()) {
  if(os_name == "Windows") {
    ui_info("Check if you have Rtools installed by running {ui_code(pkgbuild::find_rtools())} in the Console. If you don't, browse to https://apps.apple.com/us/app/xcode/id497799835")
  }

  if(os_name == "MacOS") {
    ui_info("Check if you have XCode installed by running 'xcode-select -p' in the Terminal. If you don't, browse to https://cran.r-project.org/bin/windows/Rtools/")
  }

  if(os_name == "Linux") {
    ui_oops("You seem to be using Linux. {ui_code('packagepal')} doesn't support Linux, but you probably don't need to use it anyway right?")
  }
}


#' Has This Package Been Installed?
#'
#' @description Given the name of a package, check whether or not it's
#' installed. Offer to install it if it's not.
#'
#'
#' @param package The name of a R package, passed as a character string.
#' @param install_missing_packages Install missing packages automatically?
#'
#' @return A side-effect of either {ui_done}, or {ui_yeah}, returned as a
#'   message to the console.
#'
#' @noRd
check_for_package <- function(package, install_missing_packages) {
  if(!require(package, character.only = TRUE, quietly = TRUE)) {
    pal_install_package(package, install_missing_packages)
  } else {
    ui_done("Congrats, you've already installed {ui_value(package)}!")
  }
}


#' Which Operating System Is Being Used?
#'
#' @return A string, either "Windows", "MacOS", or "Linux".
#'
#' @noRd
get_os_name <- function() {
  if(Sys.info()["sysname"] == "Windows") {
    return("Windows")
  } else if(Sys.info()["sysname"] == "Darwin") {
    return("MacOS")
  } else {
    return("Linux")
  }
}


#' Offer To Install A R Package
#'
#' @param package The name of the R package as a character string.
#' @param install_missing_packages Install missing packages automatically?
#'
#' @return Either a message to the console returned from {ui_done()}, or
#'   invisible {NULL} if {install.packages()} is called.\
#'
#' @noRd
pal_install_package <- function(package, install_missing_packages) {
  if(install_missing_packages) {
    ui_done("You haven't installed {ui_value(package)} yet. I'll download it for you now.")
    install.packages(package)
  } else {
    ui_done("You haven't installed {ui_value(package)} yet, but you've asked me not to download it for you right now.")
  }
}
