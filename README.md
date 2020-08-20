
<!-- README.md is generated from README.Rmd. Please edit that file -->
quickstats
==========

The goal of quickstats is to save some time when doing basic data anaysis with DPLYR

Installation
------------

You can install the released version of quickstats from [Github](https://github.com/despresj/quickstats) with:

``` r
install.packages("devtools")
devtools::install_github("despresj/quickstats")
library(quickstats)
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(quickstats)
## basic example code
```

Return a tibble tailored to non-statisticans attempting to maximizing their understanding of their data

``` r
stats_presentable(mtcars, mpg, cyl)
#> # A tibble: 3 x 7
#>     cyl Total `25%` `50%` `75%` Average Observations
#>   <dbl> <dbl> <dbl> <dbl> <dbl>   <dbl>        <dbl>
#> 1     4  293.  22.8  26    30.4    26.7           11
#> 2     6  138.  18.6  19.7  21      19.7            7
#> 3     8  211.  14.4  15.2  16.2    15.1           14
```

This tibble that gives a quick summary of the data

``` r
stats_summary(mtcars, mpg, cyl)
#> # A tibble: 3 x 9
#>     cyl Total  Mean Median `Mean - Med`   Std   Min   Max Number
#>   <dbl> <dbl> <dbl>  <dbl>        <dbl> <dbl> <dbl> <dbl>  <dbl>
#> 1     4  293.  26.7   26            0.7   4.5  21.4  33.9     11
#> 2     6  138.  19.7   19.7          0     1.5  17.8  21.4      7
#> 3     8  211.  15.1   15.2         -0.1   2.6  10.4  19.2     14
```

Adjust the rounding

``` r
stats_presentable(mtcars, mpg, rounding_digits = 5)
#> # A tibble: 1 x 6
#>   Total `25%` `50%` `75%` Average Observations
#>   <dbl> <dbl> <dbl> <dbl>   <dbl>        <dbl>
#> 1  643.  15.4  19.2  22.8    20.1           32
```

Use two grouping variables

``` r
stats_summary(mtcars, mpg, am, rounding_digits = 5)
#> # A tibble: 2 x 9
#>      am Total  Mean Median `Mean - Med`   Std   Min   Max Number
#>   <dbl> <dbl> <dbl>  <dbl>        <dbl> <dbl> <dbl> <dbl>  <dbl>
#> 1     0  326.  17.1   17.3       -0.153  3.83  10.4  24.4     19
#> 2     1  317.  24.4   22.8        1.59   6.17  15    33.9     13
```

Using the notin operator

``` r
dplyr::filter(mtcars, carb %!in% c(1,2,3))
#>     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
#> 1  21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
#> 2  21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
#> 3  14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
#> 4  19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
#> 5  17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
#> 6  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
#> 7  10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
#> 8  14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
#> 9  13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
#> 10 15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
#> 11 19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
#> 12 15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
```
