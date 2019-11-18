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
