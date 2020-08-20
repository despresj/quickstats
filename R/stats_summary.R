#' @title stats_summary
#'
#' @description basic summary statistics using dplyr
#'
#' @param df
#' @param x
#' @param group_var1
#' @param group_var2
#' @param rounding_digits
#'
#' @return Tibble
#' @export
#'
#' @import dplyr
#' @examples
#'
#' Use one or two grouping variables
#' stats_summary(mtcars, mpg, cyl)
#' stats_summary(mtcars, mpg, cyl, am)
#'
#' Adjust the rounding
#' stats_summary(mtcars, mpg, cyl, am, 5)
#' stats_summary(mtcars, mpg, cyl, am, rounding_digits = 5)
#'
#'
#'
#'
stats_summary <- function(df, x, group_var1, group_var2, rounding_digits = 1){

    x <- dplyr::enquo(x)

    group_var1 <- dplyr::enquo(group_var1)
    group_var2 <- dplyr::enquo(group_var2)

    df %>%
      dplyr::group_by(!!group_var1, !!group_var2) %>%
      dplyr::summarise(Total = sum ( !! x),
                       Mean  = mean( !! x),
                     Median  = median( !! x),
                `Mean - Med` =  mean( !! x) - median( !! x),
                         Std = sd  ( !! x),
                         Min = min ( !! x),
                         Max = max ( !! x),
                      Number = n() ) %>%
      dplyr::mutate_if(is.numeric, round, rounding_digits)
  }

