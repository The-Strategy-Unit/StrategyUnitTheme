# StrategyUnitTheme

This package provides ggplot2 themes and colour palettes for use by The Strategy Unit.

## Install Instructions

This package can be installed using devtools:

```{r}
devtools::install_github("tomjemmett/StrategyUnitTheme")
```

All of the exported functions start with the prefix "su_theme_", except for the ggplot2 gradient colour scale functions,
which are of the form scale_*_su.

## Usage

The following functions are available in the package currently

| Function | Description |
|---|---|
| `r su_theme_cols` | Returns a list of hex encoded RGB colours used in the theme             |
| `r su_theme_pal`  | Creates a colorRamp palette based on colours in the theme               |
| `r su_colour_su`  | Creates a colour scale based on an SU palette for use in ggplot2 charts |
| `r su_fill_su`    | Creates a fill scale based on an SU palette for use in ggplot2 charts   |

For more complete details, view the help files in R for each of these functions
