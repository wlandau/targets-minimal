
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

1.  Open the R console and call `renv::restore()` to install the
    required R packages.
2.  call the
    [`tar_make()`](https://wlandau.github.io/targets/reference/tar_make.html)
    function to run the pipeline.
3.  Then, call `tar_read(hist)` to retrieve the histogram.
4.  Experiment with [other
    functions](https://wlandau.github.io/targets/reference/index.html)
    such as
    [`tar_visnetwork()`](https://wlandau.github.io/targets/reference/tar_visnetwork.html)
    to learn how they work.

## File structure

The most important files are:

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

## Continuous deployment (advanced)

Whenever this GitHub repository is updated, the `targets` pipeline runs
in a [GitHub Actions
workflow](https://github.com/wlandau/targets-minimal/actions). The
workflow pushes the results to the
[`targets-runs`](https://github.com/wlandau/targets-minimal/tree/targets-runs)
branch, and the R Markdown report is deployed to
<https://wlandau.github.io/targets-minimal/> using [GitHub
Pages](https://pages.github.com/). Subsequent runs restore the output
files from the previous run so up-to-date targets do not rebuild. To
enable continuous deployment in your own project:

1.  Ensure your project stays within the storage and compute limitations
    of GitHub. For storage, you may choose the AWS-backed storage
    formats (e.g. `tar_target(..., format = "aws_qs")`) to reduce the
    burden of any large datasets.
2.  Ensure GitHub Actions are enabled in the Settings tab of your GitHub
    repository’s website.
3.  Set up your project with [`renv`](https://rstudio.github.io/renv/)
    ([details here](https://rstudio.github.io/renv/articles/ci.html)).
      - Call `targets::tar_renv(extras = character(0))` to write a
        `_packages.R` file to expose hidden dependencies.
      - Call `renv::init()` to initialize the package library or
        `renv::snapshot()` to update it.
      - At minimum, commit files `.Rprofile`, `renv.lock`, and
        `renv/activate.R` to your Git repository.
4.  Write the
    [`.github/workflows/targets.yaml`](https://github.com/wlandau/targets-minimal/blob/main/.github/workflows/targets.yaml)
    workflow file using `targets::tar_github_actions()` and commit this
    file to Git.
5.  Push to GitHub. A GitHub Actions workflow should run the pipeline
    and upload the results to the `targets-runs` branch of your
    repository. Subsequent runs should add new commits but not
    necessarily rerun targets.
