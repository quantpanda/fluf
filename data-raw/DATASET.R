# Workflow
# License: MIT




## code to prepare `DATASET` dataset goes here
# this load a dataset of s&p500 stock prices for the last 4 years.
library(tidyquant)
library(tidyverse)

## snp
snp <-
  tidyquant::tq_get(
    c("SPY"),
    from = Sys.Date() - (365*4),
    to = Sys.Date(),
    get = "stock.prices",
  ) %>%
  dplyr::select(date, series = symbol, value = adjusted) %>%
  dplyr::group_by(series)

usethis::use_data(snp, overwrite = T)

## topTech
topTech <-
  tidyquant::tq_get(c("MSFT", "AAPL", "AMZN"),
                    from = Sys.Date() - 365,
                    to = Sys.Date(),
                    get = "stock.prices") %>%
  dplyr::select(date, series = symbol, price = adjusted) %>%
  dplyr::group_by(series)

usethis::use_data(topTech, overwrite = T)

## index
indexes <-
  tidyquant::tq_get(c("FXI", "IWM"),
                    from = Sys.Date() - 365,
                    to = Sys.Date(),
                    get = "stock.prices") %>%
  dplyr::select(date, series = symbol, price = adjusted) %>%
  tidyr::pivot_wider(names_from = series, values_from = price)

usethis::use_data(indexes, overwrite = T)



