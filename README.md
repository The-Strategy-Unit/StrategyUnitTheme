# StrategyUnitTheme

<!-- badges: start -->

[![Travis build
status](https://api.travis-ci.org/The-Strategy-Unit/StrategyUnitTheme.svg?branch=master)](https://travis-ci.org/The-Strategy-Unit/StrategyUnitTheme)
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Codecov test coverage](https://codecov.io/gh/The-Strategy-Unit/StrategyUnitTheme/branch/master/graph/badge.svg)](https://codecov.io/gh/The-Strategy-Unit/StrategyUnitTheme?branch=master)
<!-- badges: end -->

This package provides ggplot2 themes and colour palettes for use by The Strategy Unit.

## Install Instructions

This package can be installed using devtools:

```{r}
devtools::install_github("The-Strategy-Unit/StrategyUnitTheme")
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
| `r su_theme`      | Returns a ggplot2 theme                                                 |
| `r su_document`   | For use in RMarkdown documents to use a branded Word Document template  |

For more complete details, view the help files in R for each of these functions
