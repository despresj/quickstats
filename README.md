
<!-- README.md is generated from README.Rmd. Please edit that file -->
quickstats
==========

The goal of quickstats is to save some time when doing basic data anaysis with DPLYR

Installation
------------

You can install the released version of quickstats from [Github](https://CRAN.R-project.org) with:

``` r
install.packages("quickstats")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(quickstats)
# figure out dependancy issue!
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
## basic example code
```

Return a tibble tailored to non-statisticans

``` r
stats_presentable(mtcars, mpg, cyl)
#> # A tibble: 3 x 7
#>     cyl Total `25%` `50%` `75%` Average Amount
#>   <dbl> <dbl> <dbl> <dbl> <dbl>   <dbl>  <dbl>
#> 1     4  293.  22.8  26    30.4    26.7     11
#> 2     6  138.  18.6  19.7  21      19.7      7
#> 3     8  211.  14.4  15.2  16.2    15.1     14
```

This tibble that gives a quick summary of the data

``` r
stats_summary(mtcars, mpg, cyl)
#> # A tibble: 3 x 8
#>     cyl Total Average Median `Minimum Value` `Maximum Value` `Std. Dev` Number
#>   <dbl> <dbl>   <dbl>  <dbl>           <dbl>           <dbl>      <dbl>  <dbl>
#> 1     4  293.    26.7   26              21.4            33.9        4.5     11
#> 2     6  138.    19.7   19.7            17.8            21.4        1.5      7
#> 3     8  211.    15.1   15.2            10.4            19.2        2.6     14
```
