#' @rdname su_theme_gradient_colour_scales
#' @name su_theme_gradient_colour_scales
#' @title Strategy Unit Theme Gradient colour Scale
#'
#' @description
#' Generates a two colour gradient (low-high)
#'
#' @param palette The name of palette to use
#' @param discrete Optional: boolean to indicate that this scale is a discrete
#'    scale. Defaults to TRUE
#' @param reverse Optional: boolean to reverse the direction of the scale.
#'    Defaults to FALSE
#' @param ... additional arguments passed to the ggplot functions
#'
#' @return a scale object to be used with a ggplot object
#'
NULL

#' @export
#' @importFrom ggplot2 discrete_scale scale_color_gradientn
#' @rdname su_theme_gradient_colour_scales
scale_colour_su <- function(palette = su_theme_palettes, discrete = TRUE, reverse = FALSE, ...) {
  palette <- match.arg(su_theme_palettes)

  pal <- su_theme_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("su_theme_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}
#' @export
#' @rdname su_theme_gradient_colour_scales
scale_color_su <- scale_colour_su

#' @export
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn
#' @rdname su_theme_gradient_colour_scales
scale_fill_su <- function(palette = su_theme_palettes, discrete = TRUE, reverse = FALSE, ...) {
  palette <- match.arg(su_theme_palettes)

  pal <- su_theme_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("su_theme_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
