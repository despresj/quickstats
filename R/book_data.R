#' @title book_data
#'
#' @description obtin data from 863 book
#'
#' @param chapter
#' @param problem
#'
#' @examples
#' book_data(chapter = 1, problem = 19)
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

