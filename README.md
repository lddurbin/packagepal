
<!-- README.md is generated from README.Rmd. Please edit that file -->

# packagepal

<!-- badges: start -->

[![R-CMD-check](https://github.com/lddurbin/packagepal/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/lddurbin/packagepal/actions/workflows/R-CMD-check.yaml)
[![test-coverage](https://github.com/lddurbin/packagepal/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/lddurbin/packagepal/actions/workflows/test-coverage.yaml)
<!-- badges: end -->

The goal of packagepal is to be a good pal for R package builders.

## Installation

``` r
install.packages("packagepal")
```

## Get Started

To get started with `packagepal`, simply call:

``` r
packagepal::checklist()
```

## Acknowledgements

This package was inspired by Building Tidy Tools, a workshop delivered
by Emma Rand and Ian Lyttle at rstudio::conf(2022). Although I didn’t
attend this workshop myself, the slides are [freely available
online](https://rstudio-conf-2022.github.io/build-tidy-tools/) and
taught me how to make my first R package. I still refer to them all the
time.

I have also borrowed ideas from *R Packages (2e)* by Hadley Wickham and
Jennifer Bryan, as well as here:
<https://github.com/DavisVaughan/extrachecks>
