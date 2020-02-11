#' Creates the Strategy Unit Theme for ggplot
#'
#' Creates a base theme for ggplot objects. By default this uses a font that
#' requires the \link[extrafont]{extrafont} package installed and
#' \href{https://blog.revolutionanalytics.com/2012/09/how-to-use-your-favorite-fonts-in-r-charts.html}{set up}.
#'
#' @param base_family The font to use in this theme
#'
#' @export
#'
#' @import ggplot2
#'
#' @example
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, colour = Species)) +
#'   geom_point() +
#'   su_theme()
su_theme <- function(base_family = "Segoe UI") {
  theme_classic(base_family = base_family) +
    theme(panel.background = element_blank(),
          panel.grid = element_blank(),
          axis.line = element_line(colour = su_theme_cols("charcoal")),
          strip.background = element_rect(fill = su_theme_cols("light_grey"))
    )
}
