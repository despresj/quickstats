
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

``` r
stats_summary(mtcars, mpg, cyl)
#> # A tibble: 3 x 8
#>     cyl Total Average Median `Minimum Value` `Maximum Value` `Std. Dev` Number
#>   <dbl> <dbl>   <dbl>  <dbl>           <dbl>           <dbl>      <dbl>  <dbl>
#> 1     4  293.    26.7   26              21.4            33.9        4.5     11
#> 2     6  138.    19.7   19.7            17.8            21.4        1.5      7
#> 3     8  211.    15.1   15.2            10.4            19.2        2.6     14
```

``` r
stats_summary(mtcars, mpg, cyl)
#> # A tibble: 3 x 8
#>     cyl Total Average Median `Minimum Value` `Maximum Value` `Std. Dev` Number
#>   <dbl> <dbl>   <dbl>  <dbl>           <dbl>           <dbl>      <dbl>  <dbl>
#> 1     4  293.    26.7   26              21.4            33.9        4.5     11
#> 2     6  138.    19.7   19.7            17.8            21.4        1.5      7
#> 3     8  211.    15.1   15.2            10.4            19.2        2.6     14
```

In that case, don't forget to commit and push the resulting figure files, so they display on GitHub!
