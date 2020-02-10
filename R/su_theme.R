#' Creates the Strategy Unit Theme for ggplot
#'
#' Creates a base theme for ggplot objects. Make sure that you have installed
#' the \link[extrafont]{extrafont} package and
#' \href{https://blog.revolutionanalytics.com/2012/09/how-to-use-your-favorite-fonts-in-r-charts.html}{set it up}.
#'
#' @export
#'
#' @importFrom purrr partial
#' @importFrom extrafont fonts
#' @importFrom ggplot2 theme_set theme_classic theme element_blank element_line
#'     element_rect
su_theme <- function() {


  # use
  font <- "Segoe UI"
  if (font %in% fonts()) {
    warning(paste0("The font ", font, " does not appear to be installed: ",
                   "have you installed fonts (see extrafont package)"))
    font <- ""
  }

  # set the default theme
  theme_set(
    theme_classic(base_family = font) +
      theme(panel.background = element_blank(),
            panel.grid = element_blank(),
            axis.line = element_line(colour = su_theme_cols("charcoal")),
            strip.background = element_rect(fill = su_theme_cols("light_grey"))
      )
  )

  invisible(TRUE)
}
