library(testthat)
library(mockery)

context("su_document")

test_that("calls rmarkdown::word_document", {
  m <- mock("word_document")
  stub(su_document, "rmarkdown::word_document", m)

  stub(su_document, "system.file", "su_template.docx")
  stub(su_document, "ggplot2::theme_set", "")

  su_document()

  expect_called(m, 1)
  expect_args(m, 1,
    toc = FALSE,
    toc_depth = 1,
    fig_width = 6.7,
    fig_height = 3.8,
    fig_caption = TRUE,
    df_print = "kable",
    highlight = "default",
    reference_docx = "su_template.docx",
    keep_md = FALSE,
    md_extensions = NULL,
    pandoc_args = NULL
  )
})

test_that("it sets the ggplot theme to su_theme", {
  m <- mock("su_theme")
  stub(su_document, "ggplot2::theme_set", m)

  stub(su_document, "rmarkdown::word_document", "")
  stub(su_document, "system.file", "")

  su_document()

  expect_called(m, 1)
  expect_call(m, 1, ggplot2::theme_set(su_theme()))
})

test_that("it uses the correct template file if using numbered headings", {
  m <- mock("su_template.docx", cycle = TRUE)
  stub(su_document, "system.file", m)

  stub(su_document, "rmarkdown::word_document", "")
  stub(su_document, "ggplot2::theme_set", "")

  su_document(use_numbered_headings = FALSE)
  su_document(use_numbered_headings = TRUE)

  expect_called(m, 2)

  expect_args(m, 1,
    "rmarkdown/templates/su-document",
    "Strategy_Unit_Template.docx",
    package = "StrategyUnitTheme"
  )

  expect_args(m, 2,
    "rmarkdown/templates/su-document",
    "Strategy_Unit_Template_Numbered_Headings.docx",
    package = "StrategyUnitTheme"
  )
})
