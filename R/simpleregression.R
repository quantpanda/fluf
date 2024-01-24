#' Runs a simple linear regression on two variables
#'
#' This function takes two variables and runs a simple linear regression and outputs the stats
#'
#' @param data A long dataframe with columns 'dependent' and 'independent'.
#' @return Linear regression stats
#'
#' @examples
#' x <- c(2, 4, 6, 8)
#' y <- c(10, 12, 14, 20)
#' data <- data.frame(x, y)
#'
#' simpleregression(data)
#'
#' @export
simpleregression <- function(data) {
  lr <- stats::lm(y ~ x, data = data)
  lrstats <- summary(lr)
  return(lrstats)
}
