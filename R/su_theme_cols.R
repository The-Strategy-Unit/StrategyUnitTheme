#' Strategy Unit Theme Colours Vector
#'
#' The colours that are used in the Strategy Unit Theme. Non-exported (used by
#' other functions e.g. su_theme_cols)
su_theme_colours <- c(orange         = "#f8bf07",
                      charcoal       = "#2c2825",
                      slate          = "#686f73",
                      blue           = "#581dc1",
                      red            = "#ec6555",
                      yellow         = "#fce59b",
                      grey           = "#a3a8ac",
                      white          = "#ffffff",
                      light_orange   = "#fdf2cd",
                      dark_orange    = "#7c5f03",
                      light_charcoal = "#ebe9e7",
                      dark_charcoal  = "#000000",
                      light_slate    = "#e0e2e3",
                      dark_slate     = "#333739",
                      light_blue     = "#dde5f2",
                      dark_blue      = "#263d66",
                      light_red      = "#fbe0dc",
                      dark_red       = "#901d10",
                      light_yellow   = "#fef9eb",
                      dark_yellow    = "#c59805",
                      light_grey     = "#ecedee",
                      dark_grey      = "#4f5458",
                      light_white    = "#f2f2f2",
                      dark_white     = "#7f7f7f")

#' Strategy Unit Theme Palettes Vector
#' The palettes that are used in the Strategy Unit Theme. Non-exported (used by
#' other functions e.g. su_theme_cols)
su_theme_palettes <- c("main",
                       "oranges",
                       "slates",
                       "mixed",
                       "oj_coal",
                       "oj_red")

#' Strategy Unit Theme Colours
#'
#' This function returns the colours that are used in the Strategy Unit theme as
#' a named vector of RGB values in hexadecimal form.
#'
#' If no arguments are passed to the function, then all of the colours are
#' returned. If only specific colours are required, then the names of the
#' colours that are required can be passed as strings to the function, and only
#' those colours will be returned.
#'
#' If a "pallete" is selected then no arguments should be passed to ...
#'
#' Only one palete can be selected at a time.
#'
#' @param ... individual colours that you wish to get the values of
#' @param palette a name of a palette to select the colours of
#'
#' @return a named vector of RGB colours in hexadecimal form
#' @export
#'
#' @examples
#' # show all of the colours
#' su_theme_cols()
#' # or, just show some colours
#' su_theme_cols("orange", "red", "grey")
#' # or, select a single palette
#' su_theme_cols(palette = "slates")
su_theme_cols <- function(..., palette = c(NA, su_theme_palettes)) {
  # take the ... argument's and convert to a unique vector
  dots <- unique(c(...))
  # verify that the palette argument is valid, i.e. it is in the list of allowed
  # values (from the argument definition)
  pallete <- match.arg(palette)

  # if a palette has not been selected, then return the selected colours
  if (is.na(pallete)) {
    # if no colour's have been specified, then select all
    if (length(dots) < 1) {
      dots <- names(su_theme_colours)
    }
    # immediately return the selected colours
    return (su_theme_colours[dots])
  }

  # if we are selecting a palette then we shouldn't be specifying colours to
  # select
  if (length(dots) > 0) {
    stop("cannot specify colours and a palette to use")
  }

  # return the colours that are part of this palette
  colours <- switch(palette,
                    "main" = c("orange","charcoal","slate","blue","red"),
                    "oranges" = c("light orange","orange","dark orange"),
                    "slates" = c("light slate","slate","dark slate"),
                    "mixed" = c("dark red","orange","yellow","light blue","slate"),
                    "oj_coal" = c("yellow","orange","red","dark red","dark charcoal"),
                    "oj_red" = c("yellow","orange","red","dark red"))

  # return the colours from the selected palette
  return(su_theme_colours[colours])
}
