library(testthat)

context("su_theme_cols")

su_theme_colours <- c(
  orange = "#f9bf07",
  charcoal = "#2c2825",
  slate = "#686f73",
  blue = "#5881c1",
  red = "#ec6555",

  light_orange = "#fcdf83",
  light_charcoal = "#9d928a",
  light_slate = "#b2b7b9",
  light_blue = "#abc0e0",
  light_red = "#f5b2aa",

  dark_orange = "#7c5f03",
  dark_charcoal = "#151412",
  dark_slate = "#343739",
  dark_blue = "#263f66",
  dark_red = "#901d10"
)

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
  fn("red", "orange", "dark_slate")
})

test_that("when a palette is passed, only the palettes colours are returned", {
  fn <- function(palette, colours) {
    expected <- su_theme_colours[colours]
    actual <- su_theme_cols(palette = palette)
    expect_equal(actual, expected)
  }

  fn("main", c("orange", "red", "blue"))
  fn("oranges", c("light_orange", "orange", "dark_orange"))
  fn("charcoals", c("light_charcoal", "charcoal", "dark_charcoal"))
  fn("slates", c("light_slate", "slate", "dark_slate"))
  fn("reds", c("light_red", "red", "dark_red"))
  fn("blues", c("light_blue", "blue", "dark_blue"))
})

test_that("an error occurs when an invalid palette is passed", {
  expect_error(su_theme_cols(palette = "invalid_palette"))
})

test_that("an error occurs if a palette is specified as well as colours", {
  expect_error(su_theme_cols("orange", palette = "main"))
})
