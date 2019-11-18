library(testthat)
library(mockery)

context("su_theme_gradient_colour_scales")

test_that("scale_color_su is the same as scale_colour_su", {
  expect_identical(scale_color_su, scale_colour_su)
})

test_that("scale_colour_su calls su_theme_pal", {
  m <- mock(function(n) rep("#000000", n), cycle = TRUE)

  stub(scale_colour_su, "su_theme_pal", m)

  scale_colour_su()
  scale_colour_su("oranges", reverse = TRUE)

  expect_called(m, 2)

  expect_args(m, 1, palette = "main", reverse = FALSE)
  expect_args(m, 2, palette = "oranges", reverse = TRUE)
})

test_that("scale_colour_su calls discrete_scale", {
  pal <- function(n) rep("#000000", n)
  pal_mock <- mock(pal)

  m1 <- mock("discrete_scale")
  m2 <- mock("scale_color_gradientn")

  stub(scale_colour_su, "su_theme_pal", pal_mock)
  stub(scale_colour_su, "discrete_scale", m1)
  stub(scale_colour_su, "scale_color_gradientn", m2)

  actual <- scale_colour_su()
  expect_called(m1, 1)
  expect_called(m2, 0)

  expect_args(m1, 1, "colour", "su_theme_main", palette = pal)

  expect_equal(actual, "discrete_scale")
})


test_that("scale_colour_su calls scale_color_gradientn", {
  pal <- function(n) rep("#000000", n)
  pal_mock <- mock(pal)

  m1 <- mock("discrete_scale")
  m2 <- mock("scale_color_gradientn")

  stub(scale_colour_su, "su_theme_pal", pal_mock)
  stub(scale_colour_su, "discrete_scale", m1)
  stub(scale_colour_su, "scale_color_gradientn", m2)

  actual <- scale_colour_su(discrete = FALSE)
  expect_called(m1, 0)
  expect_called(m2, 1)

  expect_args(m2, 1, palette = pal(256))

  expect_equal(actual, "scale_color_gradientn")
})
