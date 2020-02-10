#' Convert to an Strategy Unit Word document
#'
#' Format for converting from R Markdown to a Strategy Unit branded MS Word document.
#'
#' See the \href{https://rmarkdown.rstudio.com/word_document_format.html}{online
#' documentation} for additional details on using the \code{word_document} format.
#'
#' R Markdown documents can have optional metadata that is used to generate a
#' document header that includes the title, author, and date. For more details
#' see the documentation on R Markdown \link[=rmd_metadata]{metadata}.
#'
#' R Markdown documents also support citations. You can find more information on
#' the markdown syntax for citations in the
#' \href{https://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html}{Bibliographies
#' and Citations} article in the online documentation.
#' @inheritParams rmarkdown::pdf_document
#' @inheritParams rmarkdown::html_document

#' @return R Markdown output format to pass to \code{\link{render}}
#'
#' @importFrom rmarkdown word_document
#'
#' @examples
#' \dontrun{
#' library(rmarkdown)
#'
#' # simple invocation
#' render("input.Rmd", su_document())
#' }
#' @export
su_document <- function(toc = FALSE,
                        toc_depth = 3,
                        fig_width = 5,
                        fig_height = 4,
                        fig_caption = TRUE,
                        df_print = "default",
                        smart = TRUE,
                        highlight = "default",
                        keep_md = FALSE,
                        md_extensions = NULL,
                        pandoc_args = NULL) {

  # get the locations of resource files located within the package
  su_template <- system.file("rmarkdown/templates/su_document/Strategy_Unit_Template.docx",
                             package = "mypackage")

  # call the base word_document function
  rmarkdown::word_document(toc,
                           toc_depth,
                           fig_width,
                           fig_height,
                           fig_caption,
                           df_print,
                           smart,
                           highlight,
                           reference_docx = su_template,
                           keep_md,
                           md_extensions,
                           pandoc_args)
}
