test_that("pal_start returns everything we expect in the console", {
  if (interactive()) {
    expect_snapshot(pal_start())
  }
})


test_that("check_for_package_development_toolchain behaves correctly", {
  # Testing for Windows
  expect_snapshot(check_for_package_development_toolchain("Windows"))

  # Testing for MacOS
  expect_snapshot(check_for_package_development_toolchain("MacOS"))

  # Testing for Linux
  expect_snapshot(check_for_package_development_toolchain("Linux"))
})


