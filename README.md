
# `targets` package minimal example

[![Launch RStudio
Cloud](https://img.shields.io/badge/RStudio-Cloud-blue)](https://rstudio.cloud/project/1430691)

This repository is an example data analysis workflow with
[`targets`](https://github.com/wlandau/targets). The pipeline reads the
data from a file, preprocesses it, visualizes it, and fits a regression
model.

## The `targets` pipeline

The [`targets`](https://github.com/wlandau/targets) R package manages
the workflow. It automatically skips steps of the pipeline when the
results are already up to date, which is critical for larger projects.
[`targets`](https://github.com/wlandau/targets) also helps users
understand their workflows with interactive dependency graphs
(screenshot below).

``` r
library(targets)
tar_visnetwork()
```

![](./images/graph.png)

## File structure

The files in this example are organized as follows.

``` r
├── _targets.R
├── R/
├──── functions.R
├── data/
└──── raw_data.csv
```

| File                                                                                          | Purpose                                                                                                                                                                                                                                                                                            |
| --------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [`_targets.R`](https://github.com/wlandau/targets-minimal/blob/main/_targets.R)               | The special R script that declares the [`targets`](https://github.com/wlandau/targets) pipeline. See `tar_script()` for details.                                                                                                                                                                   |
| [`R/functions.R`](https://github.com/wlandau/targets-minimal/blob/main/R/functions.R)         | An R script with user-defined functions. Unlike [`_targets.R`](https://github.com/wlandau/targets-minimal/blob/main/_targets.R), there is nothing special about the name or location of this script. In fact, for larger projects, it is good practice to partition functions into multiple files. |
| [`data/raw_data.csv`](https://github.com/wlandau/targets-minimal/blob/main/data/raw_data.csv) | The raw `airquality` dataset.                                                                                                                                                                                                                                                                      |

## How to access

You can try out the example as long as you have a browser and an
internet connection. [Click here](https://rstudio.cloud/project/1430691)
to navigate your browser to an RStudio Cloud instance. No downloads or
installations required.

## How to run

1.  If you are running locally instead of [this RStudio cloud
    workspace](https://rstudio.cloud/project/1430691)
    1.  Install the [`targets`](https://github.com/wlandau/targets)
        package, as well as the packages listed in the
        `tar_option_set()` call in
        [`_targets.R`](https://github.com/wlandau/targets-minimal/blob/main/_targets.R).
    2.  Download the files in [this
        repository](https://github.com/wlandau/targets-minimal), either
        [through
        Git](https://happygitwithr.com/existing-github-first.html#new-rstudio-project-via-git-clone)
        or through [this
        link](https://github.com/wlandau/targets-minimal/archive/main.zip).
2.  Run the `targets` pipeline by typing
    [`tar_make()`](https://wlandau.github.io/targets/reference/tar_make.html)
    in the R console.
3.  View the results with
    [`tar_load()`](https://wlandau.github.io/targets/reference/tar_load.html)
    or
    [`tar_read()`](https://wlandau.github.io/targets/reference/tar_read.html),
    e.g. `tar_read(hist)`.
