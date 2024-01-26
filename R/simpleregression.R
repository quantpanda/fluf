#' Runs a simple linear regression on two specified variables in a dataframe
#'
#' This function takes a dataframe and two column names, then runs a simple linear regression and outputs the stats
#'
#' @param data A dataframe containing at least two columns for regression analysis.
#' @param indep_col Name of the independent variable column.
#' @param dep_col Name of the dependent variable column.
#' @return Linear regression stats
#'
#' @examples
#' data <- data.frame(MSFT = c(2, 4, 6, 8), AAPL = c(10, 12, 14, 20))
#' simpleregression(data, 'MSFT', 'AAPL')
#'
#' @export
simpleregression <- function(data, indep_col, dep_col) {
  formula <- stats::as.formula(paste(dep_col, "~", indep_col))
  lr <- stats::lm(formula, data = data)
  lrstats <- summary(lr)
  return(lrstats)
}
