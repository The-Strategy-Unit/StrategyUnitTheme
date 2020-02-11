library(testthat)
library(mockery)

context("su_presentation")

test_that("calls xaringan::moon_reader", {
  m <- mock("moon_reader")
  s <- mock("su_xaringan.css")

  stub(su_presentation, "xaringan::moon_reader", m)
  stub(su_presentation, "system.file", s)

  su_presentation()

  expect_called(s, 1)
  expect_args(s, 1,
              "rmarkdown/templates/su-presentation",
              "su_xaringan.css",
              package = "StrategyUnitTheme"
  )

  expect_called(m, 1)
})
