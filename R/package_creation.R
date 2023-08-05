#' Check If A Package Name Is Available
#'
#' @return Messages in the console.
#'
#' @export
package_name_check <- function() {
  package_name <- readline("What will you name your package? ")

  if(ui_yeah("Do you want to see if the name '{ui_value(package_name)}' is available?")) {
    available(package_name, browse = FALSE)
  } else {
    ui_done("Ok, I won't do that right now.")
  }
}


#' Create A R Package
#'
#' @param package_name The name of the package you're going to create, passed as
#'   a character string.
#'
#' @return Path to the newly created package, invisibly.
#'
#' @export
pal_create_package <- function(package_name) {
  if(ui_yeah("Do you want to create '{ui_value(package_name)}'?")) {
    if(pal_check_working_directory()) {
      ui_done("Awesome! I'll go ahead and make your package. When that's done, call {ui_code('pal_version_control()')} to continue.")
      usethis::create_package(package_name)
    }
  } else {
    ui_done("Ok, I won't do that right now.")
  }
}


#' Check If The User Is Where They Need To Be Before Creating A Package
#'
#' @return Either a message to the console, or {FALSE}.
#'
#' @noRd
pal_check_working_directory <- function() {
  if(ui_nope("Are you currently inside another RStudio project, R package or git repo?")) {
    ui_oops("Creating your package here is a bad idea. Make sure you've navigated out of the project, package, or repo first.")
  }

  return(TRUE)
}
