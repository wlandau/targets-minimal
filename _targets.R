library(targets)
library(tarchetypes)
source("R/functions.R")
options(tidyverse.quiet = TRUE)

# Uncomment below to use local multicore computing
# when running tar_make_clustermq().
options(clustermq.scheduler = "multicore")

# Uncomment below to deploy targets to parallel jobs
# on a Sun Grid Engine cluster when running tar_make_clustermq().
# options(clustermq.scheduler = "sge", clustermq.template = "sge.tmpl")
tar_option_set(packages = c("biglm", "rmarkdown", "tidyverse"))

# Define the pipeline. tar_pipeline() can accept
# individual tar_target() objects or nested lists of
# tar_target() objects.
tar_pipeline(
  tar_target(
    raw_data_file,
    "data/raw_data.csv",
    format = "file",
    deployment = "master"
  ),
  tar_target(
    raw_data,
    read_csv(raw_data_file, col_types = cols()),
    deployment = "master"
  ),
  tar_target(
    data,
    raw_data %>%
      mutate(Ozone = replace_na(Ozone, mean(Ozone, na.rm = TRUE)))
  ),
  tar_target(hist, create_plot(data)),
  tar_target(fit, biglm(Ozone ~ Wind + Temp, data)),
  tar_render(report, "report.Rmd")
)
