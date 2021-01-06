library(targets)
library(tarchetypes)
source("R/functions.R")
options(tidyverse.quiet = TRUE)
list(
  tar_target(
    raw_data_file,
    "data/raw_data.csv",
    format = "file",
    deployment = "main"
  ),
  tar_target(
    raw_data,
    read_csv(raw_data_file, col_types = cols()),
    deployment = "main"
  ),
  tar_target(
    data,
    raw_data %>%
      mutate(Ozone = replace_na(Ozone, mean(Ozone, na.rm = TRUE)))
  ),
  tar_target(hist, create_plot(data)),
  tar_target(fit, biglm(Ozone ~ Wind + Temp, data))
)
