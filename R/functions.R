#' @title Plot ozone from the preprocessed air quality data.
#' @description Plot a histogram of ozone concentration.
#' @return A ggplot histogram showing ozone content.
#' @param data Data frame, preprocessed air quality dataset.
#' @examples
#' library(ggplot2)
#' library(tidyverse)
#' data <- airquality %>%
#'   mutate(Ozone = replace_na(Ozone, mean(Ozone, na.rm = TRUE)))
#' create_plot(data)
create_plot <- function(data) {
  ggplot(data) +
    geom_histogram(aes(x = Ozone), bins = 10) +
    theme_gray(24)
}
