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

book_data <- function (chapter = 1, problem = 19) {

  link <- paste0("http://www.cnachtsheim-text.csom.umn.edu/Kutner/Chapter%20%201%20Data%20Sets/CH0",
                 chapter, "PR", problem,".txt")
  data <- read.table(link,  header = FALSE, sep = "")
  colnames(data) <- setNames(nm = c(paste0("X", seq_along(data) - 1)))
  colnames(data)[1] <- "Y"

  return(data)
}
