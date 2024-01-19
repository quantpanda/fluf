## code to prepare `DATASET` dataset goes here

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
