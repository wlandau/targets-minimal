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
  packages = c("coda", "fs", "rmarkdown", "rstan", "targets", "tidyverse")
)
tar_pipeline(
  tar_target(
    model,
    "stan/model.stan",
    format = "file",
    deployment = "local"
  ),
  tar_target(
    compiled,
    compile_model(model),
    format = "file",
    deployment = "local"
  ),
  tar_target(
    index,
    seq_len(10), # Change the number of simulations here.
    deployment = "local"
  ),
  tar_target(
    data,
    simulate_data(),
    pattern = map(index),
    format = "fst_tbl"
  ),
  tar_target(
    fit,
    fit_model(compiled, data),
    pattern = map(data),
    format = "fst_tbl"
  ),
  tar_target(
    report, {
      render("report.Rmd", quiet = TRUE)
      c(!!tar_knitr("report.Rmd"), "report.html")
    },
    format = "file",
    deployment = "local"
  )
)
