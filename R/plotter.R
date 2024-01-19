#' Create an interactive plot using Plotly from a long dataframe.
#'
#' This function takes a long dataframe as input and generates an interactive line plot
#' using the Plotly library.
#'
#' @param data A long dataframe with columns 'date', 'series', and 'value'.
#' @return An interactive Plotly plot.
#'
#' @examples
#' plotter(snp)
#'
#' @import plotly
#' @export
plotter <- function(data) {
  plot <- plot_ly(data, x = ~date, y = ~value, color = ~series, type = "scatter", mode = "lines") %>%
    layout(
      title = "S&P500 Price",
      xaxis = list(title = "Date"),
      yaxis = list(title = "Adjusted Price"),
      showlegend = TRUE
    )

  return(plot)
}
