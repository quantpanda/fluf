#' Create an interactive plot using Plotly from any Yahoo Finance ticker. This function is designed to give the user a quick glanc at the last year for the stock.
#'
#' This function takes a Yahoo Finance Ticker as input and generates an interactive line plot
#' using the Plotly library.
#'
#' @param ticker A string of a Yahoo Finance ticker
#' @return An interactive Plotly plot.
#'
#' @examples
#' plot_fluf("TSLA")
#'
#' @import plotly
#' tidyquant
#' @export

plot_fluf <- function(ticker) {
  # Get historical stock data using tq_get
  stock_data <- tidyquant::tq_get(ticker, from = Sys.Date() - 365, to = Sys.Date())
  # Plotting using plotly
  plot <- plotly::plot_ly(stock_data, x = ~date, y = ~adjusted, type = 'scatter', mode = 'lines', line = list(color = 'blue')) %>%
    layout(title = paste("Last Year Closing Prices for", ticker),
           xaxis = list(title = "Date"),
           yaxis = list(title = "Closing Price"))

  # Show the interactive plot
  return(plot)
}
