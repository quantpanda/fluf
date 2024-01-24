#' Create and plot Bollinger Bands
#'
#' @description Takes a dataframe with price, creates Bollinger Bands,
#' plots an interactive chart and returns a dataframe
#'
#' @param data A long dataframe containing 'date', 'series', and 'price'
#' @param n The number of periods for Exponential Moving Average
#' @param dev Standard deviation of trend line
#' @param filtSeries Filter to apply to series (default: First series in data)
#' @returns
#' A list containing the following:
#'
#' \item{data}{dataframe containing Bollinger Band requirements `tibble`}
#' \item{plot}{A plot of the Bollinger Bands with the n-day SMA}
#'
#' @examples
#' bolBands(data = topTech, n = 20, dev = 2)
#' bolBands(data = topTech, n = 20, dev = 2, filtSeries = "AAPL")
#'
#' @export

bolBands <- function (data, n, dev, filtSeries){
  newData = list()
  series = dplyr::pull(data, series)
  # If no filter is provided, get first series in data
  if (missing("filtSeries")) {
    filtSeries <- unique(data$series)[1]
  }

  dataset <- data %>%
    dplyr::filter(series == filtSeries)

  sma <- TTR::SMA(dataset$price,n)
  stdev <- rep(0,n)
  N <- nrow(dataset)
  for (i in (n+1):N){
    stdev[i]<- stats::sd(dataset$price[(i-n+1):i])
  }
  stdev <- sqrt((n-1)/n)*stdev
  upper <- sma + dev*stdev
  lower <- sma - dev*stdev
  dataset <- dataset %>%
    dplyr::ungroup() %>%
    cbind(upper, lower, sma)

  newData[["data"]] <- dataset %>% dplyr::tibble()

  newData[["plot"]] <- newData[["data"]] %>%
    plotly::plot_ly(x = ~date, y = ~sma, type = "scatter",
                    mode = "lines", name =  paste(n, "day moving avg."),
                    line = list(color = "red", width = 2)) %>%
    plotly::add_trace(y = ~upper, name = "upper band", line =
                        list(dash = "dash", width = 2, color = "black")) %>%
    plotly::add_trace(y = ~lower, name = "lower band",
                      line = list(dash = "dash", width = 2,
                                  color = "black")) %>%
    plotly::layout(title = paste(filtSeries, "Bollinger Band"),
                   xaxis = list(title = "Date"),
                   yaxis = list(title = "Price"))

  return(newData)
}
