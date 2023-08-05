#' Check-Lists For Either Building A Package Or Submitting To CRAN
#'
#' @description A check-list of things you should do when building a R package
#' from scratch, or submitting a package to CRAN.
#'
#' @param type Load the check-list items for package building (package"), or for
#'   submitting to CRAN ("CRAN")?
#'
#'
#' @return The id of the new container element, invisibly.
#'
#' @export
checklist <- function(type = "package") {
  if(type %in% c("package", "Package")) {
    return(package_checklist())
  }

  if(type %in% c("CRAN", "cran")) {
    return(cran_checklist())
  }

  return(ui_oops("Invalid check-list type: should be either 'package' or 'CRAN'."))
}


#' A Check List For Building A Package
#'
#' @description A check-list of things you should do when building a R package
#' from scratch.
#'
#' @return The id of the new container element, invisibly.
#'
#' @noRd
package_checklist <- function() {
  cli::cli_ol(c(
    "Install XCode (on MacOS) or Rtools (on Windows)",
    "Install Git",
    "Install the {.pkg devtools} package",
    "Check if your package name is available with {.pkg available}",
    "Create your package with {.code usethis::create_create('path/package_name')} (but be deliberate about {.emph where} you create it!)",
    "Make your package a Git repository using {.code usethis::use_git()}",
    "Put the package on GitHub as a remote repository using {.code usethis::use_github()}",
    "Create your first R script via {.code usethis::use_r('my_function')}",
    "Add object documentation using roxygen comments",
    "Run {.code devtools::document()} to render your documentation",
    "Create associated unit tests for your functions: with your R script open, use {.code usethis::use_test()}",
    "Check for test coverage: run {.code devtools::test_coverage_active_file()} in the active file, or {.code devtools::test_coverage()} for the whole package",
    "Add a license with {.code usethis::use_mit_license()}",
    "Update the DESCRIPTION file: edit the title, include author(s), write a one-paragraph description",
    "Add a package-level help page with {.code usethis::use_package_doc()}",
    "Run {.code devtools::check()} from time to time",
    "Document your package dependencies with either {.code usethis::use_package('package_name')} or {.code usethis::use_import_from('package_name', 'function_name')}",
    "Include a Citation File with {.code cffr::cff_write()}",
    "Add a README file with {.code usethis::use_readme_rmd()}",
    "Edit the README, and render the .Rmd file with {.code devtools::build_readme()}",
    "Add the R CMD check GitHub action with {.code usethis::use_github_action_check_standard()}",
    "Add a vignette, such as {.code usethis::use_vignette('package_pal')}. Edit the .Rmd file, then preview using {.code devtools::build_rmd('vignettes/package_pal.Rmd')}",
    "Configure your package for {.pkg pkgdown} with {.code usethis::use_pkgdown() }",
    "Build the website locally with {.code pkgdown::build_site()}",
    "Build and host the website on GitHub with {.code usethis::use_pkgdown_github_pages()}",
    "Add the workflow for the test coverage GitHub Action using {.code usethis::use_github_action('test-coverage')}",
    "Add the test coverage badge to your README with {.code usethis::use_github_actions_badge('test-coverage')}",
    "Add a News page using {.code usethis::use_news_md()}",
    "Don't forget to regularly commit your changes and push them to GitHub: {.code git add .}, {.code git commit -m 'commit message'}, and {.code git push}"
  ))
}


#' A Check List For Submitting A Package To CRAN
#'
#' @description A check-list of things you should do when submitting a new R
#'   package to CRAN.
#'
#' @return The id of the new container element, invisibly.
#'
#' @noRd
cran_checklist <- function() {
  cli::cli_ol(c(
    "Item 1",
    "Item 2",
    "Item 3"
  ))
}
