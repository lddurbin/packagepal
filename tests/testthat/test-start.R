test_that("the user's Operating System can be identified if they're working on a Mac", {
  skip_on_os(c("windows", "linux", "solaris"))

  expect_equal(get_os_name(), "MacOS")
})


test_that("the user's Operating System can be identified if they're working on Windows", {
  skip_on_os(c("mac", "linux", "solaris"))

  expect_equal(get_os_name(), "Windows")
})


test_that("check_for_git tells the user they've already installed Git", {
  expect_snapshot(check_for_git(testing = TRUE))
})


test_that("pal_check_git_token tells the user that it won't check the GitHub token situation", {
  expect_snapshot(pal_check_git_token(testing = TRUE))
})


test_that("check_for_package tells the user that they've already installed the package", {
  expect_snapshot(check_for_package("test_package", testing = TRUE))
})


test_that("check_for_rtools tells the user that it they've already installed Rtools", {
  expect_snapshot(check_for_rtools(testing = TRUE))
})


test_that("check_for_xcode tells the user that it they've already installed XCode", {
  expect_snapshot(check_for_xcode(testing = TRUE))
})


test_that("pal_install_software tells the user that it won't install the software right now", {
  expect_snapshot(pal_install_software("Test Software", "https://example.com", testing = TRUE))
})


test_that("pal_install_package tells the user that it won't install the package right now", {
  expect_snapshot(pal_install_package("test_package", testing = TRUE))
})

