library(testthat)
library(mockery)

context("su_theme")

test_that("it returns a ggplot2 theme", {
  theme <- su_theme()

  expect_s3_class(theme, c("theme", "gg"), TRUE)
})

test_that("it calls theme_classic", {
  m <- mock(cycle = TRUE)

  stub(su_theme, "theme_classic", m)

  su_theme()
  su_theme("")

  expect_called(m, 2)
  expect_args(m, 1, base_family = "Segoe UI")
  expect_args(m, 2, base_family = "")
})
