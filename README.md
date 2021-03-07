
# `targets` package minimal example

[![Launch RStudio
Cloud](https://img.shields.io/badge/RStudio-Cloud-blue)](https://rstudio.cloud/project/1430691)

This repository is an example data analysis workflow with
[`targets`](https://docs.ropensci.org/targets). The pipeline reads the
data from a file, preprocesses it, visualizes it, and fits a regression
model.

## How to access

You can try out this example project as long as you have a browser and
an internet connection. [Click
here](https://rstudio.cloud/project/1430691) to navigate your browser to
an RStudio Cloud instance. Alternatively, you can clone or download this
code repository and install the R packages [listed
here](https://github.com/wlandau/targets-minimal/blob/03835c2aa4679dcf3f28c623a06d7505b18bee17/DESCRIPTION#L25-L30).

## How to run

In the R console, call the
[`tar_make()`](https://wlandau.github.io/targets/reference/tar_make.html)
function to run the pipeline. Then, call `tar_read(hist)` to retrieve
the histogram. Experiment with [other
functions](https://wlandau.github.io/targets/reference/index.html) such
as
[`tar_visnetwork()`](https://wlandau.github.io/targets/reference/tar_visnetwork.html)
to learn how they work.

## File structure

These are the most important files.

``` r
├── _targets.R
├── R/
├──── functions.R
├── data/
├──── raw_data.csv
└── index.Rmd
```

| File                                                                                          | Purpose                                                                                                                                                                                                                                                                                            |
| --------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [`_targets.R`](https://github.com/wlandau/targets-minimal/blob/main/_targets.R)               | The special R script that declares the [`targets`](https://docs.ropensci.org/targets) pipeline. See `tar_script()` for details.                                                                                                                                                                    |
| [`R/functions.R`](https://github.com/wlandau/targets-minimal/blob/main/R/functions.R)         | An R script with user-defined functions. Unlike [`_targets.R`](https://github.com/wlandau/targets-minimal/blob/main/_targets.R), there is nothing special about the name or location of this script. In fact, for larger projects, it is good practice to partition functions into multiple files. |
| [`data/raw_data.csv`](https://github.com/wlandau/targets-minimal/blob/main/data/raw_data.csv) | The raw `airquality` dataset.                                                                                                                                                                                                                                                                      |

[`index.Rmd`](https://github.com/wlandau/targets-minimal/blob/main/index.Rmd):
an R Markdown report that reruns in the pipeline whenever the histogram
of ozone changes
([details](https://books.ropensci.org/targets/files.html#literate-programming)).

## Continuous deployment

Whenever this GitHub repository is updated, the `targets` pipeline runs
in a [GitHub Actions
workflow](https://github.com/wlandau/targets-minimal/actions). The
workflow pushes the results to the
[`targets-runs`](https://github.com/wlandau/targets-minimal/tree/targets-runs)
branch, and the R Markdown report is deployed to
<https://wlandau.github.io/targets-minimal/> using [GitHub
Pages](https://pages.github.com/). Subsequent runs pull `_targets/` and
`index.html` from the latest run in
[`targets-runs`](https://github.com/wlandau/targets-minimal/tree/targets-runs),
so up-to-date targets do not rerun.

To enable continuous deployment in your own project, copy the
[`.github/workflows/targets.yaml`](https://github.com/wlandau/targets-minimal/blob/main/.github/workflows/targets.yaml)
workflow file to your GitHub repository (with proper attribution
according to the [MIT
license](https://github.com/wlandau/targets-minimal/blob/main/LICENSE.md))
and change `index.html` and `targets-runs/index.html` to whatever
external output files your pipeline will create. Keep in mind that
GitHub has strict storage limitations, so this pattern is only
appropriate for small [`targets`](https://docs.ropensci.org/targets)
pipelines.
