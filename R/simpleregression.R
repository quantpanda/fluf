#' Runs a simple linear regression on two variables
#'
#' This function takes two variables and runs a simple linear regression and outputs the stats
#'
#' @param data A long dataframe with columns 'dependent' and 'independent'.
#' @return Linear regression stats
#'
#' @examples
#' simpleregression(data)
#'
#' @import stats
#' @export
simpleregression <- function(data) {
  lr <- lm(y ~ x, data = data)
  lrstats <- summary(lr)
  return(lrstats)
}
