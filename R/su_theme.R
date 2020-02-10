#' Creates the Strategy Unit Theme for ggplot
#'
#' Creates a base theme for ggplot objects and optionally sets the default
#' ggplot colours to be a Strategy Unit Theme palette. Make sure that you have
#' installed the \link[extrafont]{extrafont} package and
#' \href{https://blog.revolutionanalytics.com/2012/09/how-to-use-your-favorite-fonts-in-r-charts.html}{set it up}.
#'
#' @export
#'
#' @param set_su_colours logical indicating whether to replace the base ggplot
#'     colours with the Strategy Unit Theme's colours
#' @param palette if `set_su_colours` is set to TRUE, then what palette to use
#'     from the Strategy Unit Theme?
#'
#' @importFrom purrr partial
#' @importFrom extrafont fonts
#' @importFrom ggplot2 theme_set theme_classic theme element_blank element_line
#'     element_rect
su_theme <- function(set_su_colours = FALSE,
                     palette = c("main", "oranges", "slates", "mixed", "oj_coal", "oj_red")) {

  if (set_su_colours) {
    palette <- match.arg(palette)
    penv <- parent.env()

    # reset the default ggplot colour/fill scales with the su theme.
    penv$scale_fill_continuous <- partial(scale_fill_su, discrete = FALSE)
    penv$scale_fill_discrete <- partial(scale_fill_su, discrete = TRUE)
    penv$scale_colour_continuous <- partial(scale_colour_su, discrete = FALSE)
    penv$scale_colour_discrete <- partial(scale_colour_su, discrete = TRUE)
  }

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
