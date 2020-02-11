library(testthat)

context("su_theme_cols")

su_theme_colours <- c(orange         = "#f8bf07",
                      charcoal       = "#2c2825",
                      slate          = "#686f73",
                      blue           = "#581dc1",
                      red            = "#ec6555",
                      yellow         = "#fce59b",
                      grey           = "#a3a8ac",
                      white          = "#ffffff",
                      light_orange   = "#fdf2cd",
                      dark_orange    = "#7c5f03",
                      light_charcoal = "#ebe9e7",
                      dark_charcoal  = "#000000",
                      light_slate    = "#e0e2e3",
                      dark_slate     = "#333739",
                      light_blue     = "#dde5f2",
                      dark_blue      = "#263d66",
                      light_red      = "#fbe0dc",
                      dark_red       = "#901d10",
                      light_yellow   = "#fef9eb",
                      dark_yellow    = "#c59805",
                      light_grey     = "#ecedee",
                      dark_grey      = "#4f5458",
                      light_white    = "#f2f2f2",
                      dark_white     = "#7f7f7f")

test_that("when no arguments all of the colours are returned", {
  expected <- su_theme_colours
  actual <- su_theme_cols()
  expect_equal(actual, expected)
})

test_that("when arguments are passed to ... only those colours are returned", {
  fn <- function(...) {
    colours <- c(...)
    expected <- su_theme_colours[colours]
    actual <- su_theme_cols(colours)
    expect_equal(actual, expected)
  }

  fn("orange")
  fn("orange", "light_orange")
  fn("red", "light_slate", "dark_white")
  fn("red", "orange", "light_white", "dark_slate")
})

test_that("when a palette is passed, only the palettes colours are returned", {
  fn <- function(palette, colours) {
    expected <- su_theme_colours[colours]
    actual <- su_theme_cols(palette = palette)
    expect_equal(actual, expected)
  }

  fn("main", c("orange", "charcoal", "slate", "blue", "red"))
  fn("oranges", c("light_orange", "orange", "dark_orange"))
  fn("slates", c("light_slate", "slate", "dark_slate"))
  fn("mixed", c("dark_red", "orange", "yellow", "light_blue", "slate"))
  fn("oj_coal", c("yellow", "orange", "red", "dark_red", "dark_charcoal"))
  fn("oj_red", c("yellow", "orange", "red", "dark_red"))
})

test_that("an error occurs when an invalid palette is passed", {
  expect_error(su_theme_cols(palette = "invalid_palette"))
})

test_that("an error occurs if a palette is specified as well as colours", {
  expect_error(su_theme_cols("orange", palette = "main"))
})
