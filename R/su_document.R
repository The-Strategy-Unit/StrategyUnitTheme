#' Convert to an Strategy Unit Word document
#'
#' Format for converting from R Markdown to a Strategy Unit branded MS Word
#' document.
#'
#' See the \href{https://rmarkdown.rstudio.com/word_document_format.html}{online
#' documentation} for additional details on using the \code{word_document}
#' format.
#'
#' @param use_numbered_headings should we use numbered headings? Defaults to
#'   false
#' @inheritParams rmarkdown::pdf_document
#' @inheritParams rmarkdown::html_document

#' @return R Markdown output format to pass to \code{\link{render}}
#'
#' @importFrom rmarkdown word_document
#' @importFrom ggplot2 theme_set
#'
#' @examples
#' \dontrun{
#' library(rmarkdown)
#'
#' # simple invocation
#' render("input.Rmd", su_document())
#' }
#' @export
su_document <- function(use_numbered_headings = FALSE,
                        toc = FALSE,
                        toc_depth = 1,
                        fig_caption = TRUE,
                        df_print = "kable",
                        highlight = "default",
                        keep_md = FALSE,
                        md_extensions = NULL,
                        pandoc_args = NULL) {

  # get the locations of resource files located within the package
  su_template <- system.file("rmarkdown/templates/su-document",
    ifelse(use_numbered_headings,
      "Strategy_Unit_Template_Numbered_Headings.docx",
      "Strategy_Unit_Template.docx"
    ),
    package = "StrategyUnitTheme"
  )

  # page width: A4 = 21cm, left+right margin = 2cm each, so width is 17cm
  fig_width <- 6.7 # ~17 cm
  fig_height <- 3.8 # ~16:9 aspect ratio

  # Set's the base ggplot theme to the Strategy Unit Theme
  ggplot2::theme_set(su_theme())

  # call the base word_document function
  rmarkdown::word_document(
    toc = toc,
    toc_depth = toc_depth,
    fig_width = fig_width,
    fig_height = fig_height,
    fig_caption = fig_caption,
    df_print = df_print,
    highlight = highlight,
    reference_docx = su_template,
    keep_md = keep_md,
    md_extensions = md_extensions,
    pandoc_args = pandoc_args
  )
}
