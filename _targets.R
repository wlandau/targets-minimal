library(targets)
source("R/functions.R")
options(tidyverse.quiet = TRUE)

# Uncomment below to use local multicore computing
# when running tar_make_clustermq().
options(clustermq.scheduler = "multicore")

# Uncomment below to deploy targets to parallel jobs
# on a Sun Grid Engine cluster when running tar_make_clustermq().
# options(clustermq.scheduler = "sge", clustermq.template = "sge.tmpl")
tar_options(packages = c("biglm", "rmarkdown", "tidyverse"))

# Define the pipeline. tar_pipeline() can accept
# individual tar_target() objects or nested lists of
# tar_target() objects.
tar_pipeline(
  tar_target(
    raw_data_file,
    "data/raw_data.csv",
    format = "file",
    deployment = "local"
  ),
  tar_target(
    raw_data,
    read_csv(raw_data_file, col_types = cols()),
    deployment = "local"
  ),
  tar_target(
    data,
    raw_data %>%
      mutate(Ozone = replace_na(Ozone, mean(Ozone, na.rm = TRUE)))
  ),
  tar_target(hist, create_plot(data)),
  tar_target(fit, biglm(Ozone ~ Wind + Temp, data)),
  tar_target(
    report, {
      render("report.Rmd", quiet = TRUE)
      c(!!tar_knitr("report.Rmd"), "report.html")
    },
    format = "file",
    deployment = "local"
  )
)
