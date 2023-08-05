test_that("the user's Operating System can be identified if they're working on a Mac", {
  skip_on_os(c("windows", "linux", "solaris"))

  expect_equal(get_os_name(), "MacOS")
})

test_that("the user's Operating System can be identified if they're working on Windows", {
  skip_on_os(c("mac", "linux", "solaris"))

  expect_equal(get_os_name(), "Windows")
})
