# package_checklist prints the correct checklist items

    Code
      package_checklist()
    Message
      1. Install XCode (<https://developer.apple.com/xcode/resources/>) (on MacOS) or
      Rtools (<https://cran.r-project.org/bin/windows/Rtools/>) (on Windows)
      2. Install Git (<https://git-scm.com/downloads>)
      3. Install the devtools package
      4. Check if your package name is available with
      `pak::pkg_name_check('your_package_name')`
      5. Create your package with `usethis::create_create('path/package_name')` (but
      be deliberate about where you create it!)
      6. Make your package a Git repository using `usethis::use_git()`
      7. Put the package on GitHub as a remote repository using
      `usethis::use_github()`
      8. Create your first R script via `usethis::use_r('my_function')`
      9. Add object documentation using roxygen comments
      10. Run `devtools::document()` to render your documentation
      11. Create associated unit tests for your functions: with your R script open,
      use `usethis::use_test()`
      12. Check for test coverage: run `devtools::test_coverage_active_file()` in the
      active file, or `devtools::test_coverage()` for the whole package
      13. Add a license with `usethis::use_mit_license()`
      14. Update the DESCRIPTION file: edit the title, include author(s), write a
      one-paragraph description
      15. Add a package-level help page with `usethis::use_package_doc()`
      16. Run `devtools::check()` from time to time
      17. Document your package dependencies with either
      `usethis::use_package('package_name', min_version = TRUE)` or
      `usethis::use_import_from('package_name', 'function_name')`
      18. Include a Citation File with `cffr::cff_write()`
      19. Add a README file with `usethis::use_readme_rmd()`
      20. Edit the README, and render the .Rmd file with `devtools::build_readme()`
      21. Add the R CMD check GitHub action with
      `usethis::use_github_action_check_standard()`
      22. Add a vignette, such as `usethis::use_vignette('package_pal')`. Edit the
      .Rmd file, then preview using
      `devtools::build_rmd('vignettes/package_pal.Rmd')`
      23. Configure your package for pkgdown with `usethis::use_pkgdown() `
      24. Build the website locally with `pkgdown::build_site()`
      25. Build and host the website on GitHub with
      `usethis::use_pkgdown_github_pages()`
      26. Add the workflow for the test coverage GitHub Action using
      `usethis::use_github_action('test-coverage')`
      27. Add the test coverage badge to your README with
      `usethis::use_github_actions_badge('test-coverage')`
      28. Add a News page using `usethis::use_news_md()`
      29. Don't forget to regularly commit your changes and push them to GitHub: `git
      add .`, `git commit -m 'commit message'`, and `git push`

# cran_checklist prints the correct checklist items

    Code
      cran_checklist()
    Message
      1. Determine the release type, which dictates the version number. Read more:
      <https://r-pkgs.org/release.html#decide-the-release-type>
      2. If the package is already on CRAN: Do due diligence on existing CRAN
      results. If this is a first release: confirm you are in compliance with CRAN
      policies. Read more: <https://r-pkgs.org/release.html#sec-release-initial>
      3. Freshen up documentation files, such as README.md and NEWS.md. Read more:
      <https://r-pkgs.org/release.html#keeping-up-with-change>
      4. Double check() that your package is passing cleanly on multiple operating
      systems and on the released and development version of R. Read more:
      <https://r-pkgs.org/release.html#double-r-cmd-checking>
      5. Perform reverse dependency checks, if other packages depend on yours. Read
      more: <https://r-pkgs.org/release.html#sec-release-revdep-checks>
      6. Address any extra ad-hoc checks that CRAN does that are not checked for by
      `devtools::check()`. Read more: <https://github.com/DavisVaughan/extrachecks>
      7. Submit the package to CRAN and wait for acceptance. Read more:
      <https://r-pkgs.org/release.html#sec-release-process>
      8. Create a GitHub release and prepare for the next version by incrementing the
      version number. Read more:
      <https://r-pkgs.org/release.html#sec-release-post-acceptance>
      9. Publicize the new version, and celebrate your success!

# checklist dispatches the correct function based on type

    Code
      checklist(type = "package")
    Message
      1. Install XCode (<https://developer.apple.com/xcode/resources/>) (on MacOS) or
      Rtools (<https://cran.r-project.org/bin/windows/Rtools/>) (on Windows)
      2. Install Git (<https://git-scm.com/downloads>)
      3. Install the devtools package
      4. Check if your package name is available with
      `pak::pkg_name_check('your_package_name')`
      5. Create your package with `usethis::create_create('path/package_name')` (but
      be deliberate about where you create it!)
      6. Make your package a Git repository using `usethis::use_git()`
      7. Put the package on GitHub as a remote repository using
      `usethis::use_github()`
      8. Create your first R script via `usethis::use_r('my_function')`
      9. Add object documentation using roxygen comments
      10. Run `devtools::document()` to render your documentation
      11. Create associated unit tests for your functions: with your R script open,
      use `usethis::use_test()`
      12. Check for test coverage: run `devtools::test_coverage_active_file()` in the
      active file, or `devtools::test_coverage()` for the whole package
      13. Add a license with `usethis::use_mit_license()`
      14. Update the DESCRIPTION file: edit the title, include author(s), write a
      one-paragraph description
      15. Add a package-level help page with `usethis::use_package_doc()`
      16. Run `devtools::check()` from time to time
      17. Document your package dependencies with either
      `usethis::use_package('package_name', min_version = TRUE)` or
      `usethis::use_import_from('package_name', 'function_name')`
      18. Include a Citation File with `cffr::cff_write()`
      19. Add a README file with `usethis::use_readme_rmd()`
      20. Edit the README, and render the .Rmd file with `devtools::build_readme()`
      21. Add the R CMD check GitHub action with
      `usethis::use_github_action_check_standard()`
      22. Add a vignette, such as `usethis::use_vignette('package_pal')`. Edit the
      .Rmd file, then preview using
      `devtools::build_rmd('vignettes/package_pal.Rmd')`
      23. Configure your package for pkgdown with `usethis::use_pkgdown() `
      24. Build the website locally with `pkgdown::build_site()`
      25. Build and host the website on GitHub with
      `usethis::use_pkgdown_github_pages()`
      26. Add the workflow for the test coverage GitHub Action using
      `usethis::use_github_action('test-coverage')`
      27. Add the test coverage badge to your README with
      `usethis::use_github_actions_badge('test-coverage')`
      28. Add a News page using `usethis::use_news_md()`
      29. Don't forget to regularly commit your changes and push them to GitHub: `git
      add .`, `git commit -m 'commit message'`, and `git push`

---

    Code
      checklist(type = "CRAN")
    Message
      1. Determine the release type, which dictates the version number. Read more:
      <https://r-pkgs.org/release.html#decide-the-release-type>
      2. If the package is already on CRAN: Do due diligence on existing CRAN
      results. If this is a first release: confirm you are in compliance with CRAN
      policies. Read more: <https://r-pkgs.org/release.html#sec-release-initial>
      3. Freshen up documentation files, such as README.md and NEWS.md. Read more:
      <https://r-pkgs.org/release.html#keeping-up-with-change>
      4. Double check() that your package is passing cleanly on multiple operating
      systems and on the released and development version of R. Read more:
      <https://r-pkgs.org/release.html#double-r-cmd-checking>
      5. Perform reverse dependency checks, if other packages depend on yours. Read
      more: <https://r-pkgs.org/release.html#sec-release-revdep-checks>
      6. Address any extra ad-hoc checks that CRAN does that are not checked for by
      `devtools::check()`. Read more: <https://github.com/DavisVaughan/extrachecks>
      7. Submit the package to CRAN and wait for acceptance. Read more:
      <https://r-pkgs.org/release.html#sec-release-process>
      8. Create a GitHub release and prepare for the next version by incrementing the
      version number. Read more:
      <https://r-pkgs.org/release.html#sec-release-post-acceptance>
      9. Publicize the new version, and celebrate your success!

---

    Code
      checklist(type = "invalid_type")
    Message
      x Invalid check-list type: should be either 'package' or 'CRAN'.

