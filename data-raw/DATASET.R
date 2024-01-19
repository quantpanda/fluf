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
