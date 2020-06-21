library(targets)
source("R/functions.R")
options(tidyverse.quiet = TRUE)

# Uncomment below to use local multicore computing
# when running tar_make_clustermq().
options(clustermq.scheduler = "multicore")

# Uncomment below to deploy targets to parallel jobs
# on a Sun Grid Engine cluster when running tar_make_clustermq().
# options(clustermq.scheduler = "sge", clustermq.template = "sge.tmpl")

tar_options(
  packages = c("biglm", "readxl", "rmarkdown", "tidyverse")
)
tar_pipeline(
  tar_target(
    raw_data_file,
    "data/raw_data.xlsx",
    format = "file",
    deployment = "local"
  ),
  tar_target(
    raw_data,
    read_excel(raw_data_file),
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
