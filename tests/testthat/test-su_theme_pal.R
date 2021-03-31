library(testthat)

context("su_theme_pal")

test_that("it returns a function", {
  expect_is(su_theme_pal(), "function")
})

test_that("it returns expected colours", {
  expected <- c("#F9BF07", "#F0833A", "#BA6E79", "#5881C1")
  actual <- su_theme_pal()(4)
  expect_equal(actual, expected)

  expected <- c("#F9BF07", "#F2922D", "#EC6555", "#A2728B", "#5881C1")
  actual <- su_theme_pal()(5)
  expect_equal(actual, expected)
})

test_that("it returns expected colours when reversed", {
  expected <- c(
    "#7C5F03", "#AE8504", "#E0AB06", "#F9C51F", "#FAD251",
    "#FCDF83"
  )
  actual <- su_theme_pal(palette = "oranges", rev = TRUE)(6)
  expect_equal(actual, expected)
})

test_that("an error occurs when an invalid palette is passed", {
  expect_error(su_theme_pal(palette = "invalid_palette"))
})
