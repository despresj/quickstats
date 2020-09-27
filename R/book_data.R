#' @title book_data
#'
#' @description obtin data from 863 book
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
book_data <- function (chapter = 1, problem = 19) {

  link <- paste0("http://www.cnachtsheim-text.csom.umn.edu/Kutner/Chapter%20%201%20Data%20Sets/CH0",
                 chapter, "PR", problem,".txt")
  data <- read.table(link,  header = FALSE, sep = "")
  colnames(data) <- setNames(nm = c(paste0("X", seq_along(data) - 1)))
  colnames(data)[1] <- "Y"

  return(data)
}
book_data()
