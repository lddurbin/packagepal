# packagepal 0.1.1

* Updated checklist function references to track upstream changes:
  - `usethis::use_github_action_check_standard()` was removed in usethis 3.0; the checklist now points to `usethis::use_github_action('check-standard')`.
  - The package-name lookup step now recommends `pak::pkg_name_check()` in place of `available::available()`.
  - Fixed a typo in the `usethis::create_package()` reference.
* Switched internal error reporting from the deprecated `usethis::ui_oops()` to `cli::cli_inform()`.

# packagepal 0.1.0

* Basic check-lists for building packages and submitting to CRAN
* First submission to CRAN
