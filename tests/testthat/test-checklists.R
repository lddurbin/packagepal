test_that("package_checklist prints the correct checklist items", {
  expect_snapshot(package_checklist())
})

test_that("cran_checklist prints the correct checklist items", {
  expect_snapshot(cran_checklist())
})

test_that("checklist dispatches the correct function based on type", {
  expect_snapshot(checklist(type = "package"))
  expect_snapshot(checklist(type = "CRAN"))
  expect_snapshot(checklist(type = "invalid_type"))
})
