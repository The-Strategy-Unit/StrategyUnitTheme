library(testthat)
library(mockery)

context("su_document")

test_that("calls rmarkdown::word_document", {
  m <- mock("word_document")
  s <- mock("su_template.docx")

  stub(su_document, "rmarkdown::word_document", m)
  stub(su_document, "system.file", s)

  su_document()

  expect_called(s, 1)
  expect_args(s, 1,
    "rmarkdown/templates/su-document/Strategy_Unit_Template.docx",
    package = "StrategyUnitTheme"
  )

  expect_called(m, 1)
  expect_args(m, 1,
    toc = FALSE,
    toc_depth = 3,
    fig_width = 5,
    fig_height = 4,
    fig_caption = TRUE,
    df_print = "default",
    smart = TRUE,
    highlight = "default",
    reference_docx = "su_template.docx",
    keep_md = FALSE,
    md_extensions = NULL,
    pandoc_args = NULL
  )
})
