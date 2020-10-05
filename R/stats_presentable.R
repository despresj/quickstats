#' @title stats_presentable
#'
#' @description
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
#'
#' @examples
#'
#' Use one or two grouping variables
#' stats_presentable(mtcars, mpg, cyl)
#' stats_presentable(mtcars, mpg, cyl, am)
#'
#' Adjust the rounding
#' stats_presentable(mtcars, mpg, cyl, am, 5)
#' stats_presentable(mtcars, mpg, cyl, am, rounding_digits = 5)
#'
#'
#'
#'
stats_presentable <- function(df, x, group_var1, group_var2, rounding_digits = 1){

  x <- dplyr::enquo(x)

  group_var1 <- dplyr::enquo(group_var1)
  group_var2 <- dplyr::enquo(group_var2)

  df %>%
    dplyr::group_by(!! group_var1, !! group_var2) %>%
    dplyr::summarise(Total = sum (!! x, na.rm = TRUE),
                     `25%` = quantile( !! x, probs = .25, na.rm = TRUE),
                     `50%` = quantile( !! x, probs = .50, na.rm = TRUE),
                     `75%` = quantile( !! x, probs = .75, na.rm = TRUE),
                   Average = mean(!! x, na.rm = TRUE),
             Observations  = n()) %>%
    mutate_if(is.numeric, round, digits = rounding_digits)
}
