library(testthat)

context("su_theme_pal")

test_that("it returns a function", {
  expect_is(su_theme_pal(), "function")
})

test_that("it returns expected colours", {
  expected <- c("#F8BF07", "#403F3F", "#5D38A6", "#EC6555")
  actual <- su_theme_pal()(4)
  expect_equal(actual, expected)

  expected <- c("#F8BF07", "#2C2825", "#686F73", "#581DC1", "#EC6555")
  actual <- su_theme_pal()(5)
  expect_equal(actual, expected)
})

test_that("it returns expected colours when reversed", {
  expected <- c("#7C5F03", "#AD8504", "#DFAB06", "#F9C92E", "#FBDD7D", "#FDF2CD")
  actual <- su_theme_pal(palette = "oranges", rev = TRUE)(6)
  expect_equal(actual, expected)
})

test_that("an error occurs when an invalid palette is passed", {
  expect_error(su_theme_pal(palette = "invalid_palette"))
})
