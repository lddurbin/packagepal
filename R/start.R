#' Package Prerequisites
#'
#' @description Check for package development toolchains, Git, {devtools}, and
#'   (optionally) run a Git token check.
#'
#'
#' @return Each check is called for its side-effect, returned as a message to
#'   the console.
#'
#' @export
pal_start <- function() {
  check_for_package_development_toolchain()
  check_for_git()
  check_for_package("devtools")
  pal_check_git_token()

  ui_info("You have the prerequisites for building your package. Call {ui_code('package_name_check()')} or go straight to {ui_code('pal_create_package()')} to continue.")
}


#' A Check List For Building A Package
#'
#' @description
#' A check-list of things you should do when building a R package from scratch.
#'
#'
#' @return The id of the new container element, invisibly.
#'
#' @export
pal_checklist <- function() {
  cli::cli_ol(c(
    "Install XCode (on MacOS) or Rtools (on Windows)",
    "Install Git",
    "Install the {.pkg devtools} package",
    "Check if your package name is available",
    "Create your package (but be deliberate about {.emph where} you create it!)",
    "Make your package a Git repository",
    "Put the package on GitHub as a remote repository",
    "Create your first R script",
    "Add object documentation using roxygen comments",
    "Run {.fn document} to render your documentation",
    "Don't forget to regularly commit your changes and push them to GitHub",
    "Create associated unit tests for your functions",
    "Check for test coverage",
    "Add a license",
    "Update the DESCRIPTION file: edit the title, include author(s), write a one-paragraph description",
    "Don't forget to regularly commit your changes and push them to GitHub",
    "Add a package-level help page with {.fn use_package_doc}",
    "Run {.fn check} from time to time",
    "Document your package dependencies",
    "Don't forget to regularly commit your changes and push them to GitHub",
    "Include a Citation File with {.fn cff_write}",
    "Add a README file",
    "Edit and render the README",
    "Add the R CMD check action",
    "Don't forget to regularly commit your changes and push them to GitHub",
    "Add a vignette",
    "Configure your package for {.pkg pkgdown}",
    "Build the website locally",
    "Build and host the website on GitHub",
    "Add the workflow for the test coverage GitHub Action",
    "Add the test coverage action",
    "Add a News page",
    "Don't forget to regularly commit your changes and push them to GitHub"
    ))
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
    return(check_for_rtools())
  }

  if(os_name == "MacOS") {
    return(check_for_xcode())
  }

  if(os_name == "Linux") {
    ui_oops("You seem to be using Linux. {packagepal} doesn't support Linux, but you probably don't need to use it anyway right?")
  }
}


#' Is Git Installed?
#'
#' @param os_name The name of the user's Operating System.
#' @param testing Is this function being used in a test ({TRUE}) or not
#'   ({FALSE})?
#'
#' @return A side-effect of either {ui_done}, or {ui_yeah}, returned as a
#'   message to the console.
#'
#' @noRd
check_for_git <- function(os_name = get_os_name(), testing = FALSE) {
  git_check <- system("git --version", intern = TRUE)

  if(!testing && !grepl("version", git_check)) {
    pal_install_software("Git", "https://git-scm.com/downloads")
  } else {
    ui_done("Congrats, you've already installed Git!")
  }
}


#' An Optional Guide Through GitHub Token Troubleshooting And Setup
#'
#' @return A side-effect of either {ui_done}, or {ui_yeah}, returned as a
#'   message to the console.
#' @param testing Is this function being used in a test ({TRUE}) or not
#'   ({FALSE})?
#'
#' @noRd
pal_check_git_token <- function(testing = FALSE) {
  if(!testing && ui_yeah("Would you like to be guided through GitHub token troubleshooting and setup?")) {
    usethis::gh_token_help()
  } else {
    ui_done("OK, I won't do that right now.")
  }
}


#' Has This Package Been Installed?
#'
#' @description Given the name of a package, check whether or not it's
#' installed. Offer to install it if it's not.
#'
#'
#' @param package The name of a R package, passed as a character string.
#' @param testing Is this function being used in a test ({TRUE}) or not
#'   ({FALSE})?
#'
#' @return A side-effect of either {ui_done}, or {ui_yeah}, returned as a
#'   message to the console.
#'
#' @noRd
check_for_package <- function(package, testing = FALSE) {
  if(!testing && !require(package, character.only = TRUE, quietly = TRUE)) {
    pal_install_package(package)
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


#' Has The User Installed Rtools?
#'
#' @description Check whether or not Rtools is installed. Offer to install it if
#'   it's not.
#'
#' @param testing Is this function being used in a test ({TRUE}) or not
#'   ({FALSE})?
#'
#' @return A side-effect of either {ui_done}, or {ui_yeah}, returned as a
#'   message to the console.
#'
#' @noRd
check_for_rtools <- function(testing = FALSE) {
  if(pkgbuild::find_rtools()) {
    pal_install_software("Rtools", "https://cran.r-project.org/bin/windows/Rtools/")
  } else {
    ui_done("Congrats, you've already installed Rtools!")
  }
}


#' Has The User Installed XCode?
#'
#' @description Check whether or not XCode is installed. Offer to install it if
#'   it's not.
#'
#' @param testing Is this function being used in a test ({TRUE}) or not
#'   ({FALSE})?
#'
#' @return A side-effect of either {ui_done}, or {ui_yeah}, returned as a
#'   message to the console.
#'
#' @noRd
check_for_xcode <- function(testing = FALSE) {
  if(!testing && grep("/", system("xcode-select -p", intern = TRUE)) != 1) {
    pal_install_software("XCode", "https://apps.apple.com/us/app/xcode/id497799835")
  } else {
    ui_done("Congrats, you've already installed XCode!")
  }
}


#' Offer To Browse To A Website To Install Software
#'
#' @param software The name of the software as a character string.
#' @param url A character string containing the URL to the website from where
#'   the software can be downloaded.
#' @param testing Is this function being used in a test ({TRUE}) or not
#'   ({FALSE})?
#'
#' @return Either a message to the console returned from {ui_done()}, or else
#'   the user is redirected to their browser via {browseURL()}.
#'
#' @noRd
pal_install_software <- function(software, url, testing = FALSE) {
  if(!testing && ui_yeah("You haven't installed {ui_value(software)} yet. Do you want to install it now?", shuffle = FALSE)) {
    browseURL(url)
  } else {
    ui_done("OK, I won't download {ui_value(software)} right now.")
  }
}


#' Offer To Install A R Package
#'
#' @param package The name of the R package as a character string.
#' @param testing Is this function being used in a test ({TRUE}) or not
#'   ({FALSE})?
#'
#' @return Either a message to the console returned from {ui_done()}, or
#'   invisible {NULL} if {install.packages()} is called.\
#'
#' @noRd
pal_install_package <- function(package, testing = FALSE) {
  if(!testing && ui_yeah("You haven't installed {ui_value(package)} yet. Do you want to install it now?")) {
    install.packages(package)
  } else {
    ui_done("OK, I won't install {ui_value(package)} right now.")
  }
}
