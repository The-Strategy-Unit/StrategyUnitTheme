#' Convert to an Strategy Unit xaringan presentation
#'
#' Format for converting from R Markdown to a Strategy Unit branded xaringan
#' presentation.
#'
#' @param ... additional arguments to pass to [xaringan::moon_reader()]
#'
#' @return R Markdown output format to pass to \code{\link{render}}
#'
#' @importFrom xaringan moon_reader
#'
#' @examples
#' \dontrun{
#' library(rmarkdown)
#'
#' # simple invocation
#' render("input.Rmd", su_presentation())
#' }
#' @export
su_presentation <- function(...) {

  # get the locations of resource files located within the package
  css <- system.file("rmarkdown/templates/su-presentation",
    "su_xaringan.css",
    package = "StrategyUnitTheme"
  )

  # call the base word_document function
  xaringan::moon_reader(
    css = c("default", css),
    self_contained = TRUE,
    ratio = "16:9",
    highlightLines = TRUE,
    countIncrementalSlides = FALSE,
    nature = list(
      highlightStyle = "github"
    ),
    ...
  )
}
