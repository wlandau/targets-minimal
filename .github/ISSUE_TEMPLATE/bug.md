---
name: Bug
about: Something is wrong with the code in this repository.
title: ""
labels: "type: bug"
assignees: wlandau
---

## Prework

* [ ] I understand and agree to this repository's [code of conduct](https://github.com/wlandau/targets-minimal/blob/main/CODE_OF_CONDUCT.md).
* [ ] I understand and agree to this repository's [contributing guidelines](https://github.com/wlandau/targets-minimal/blob/main/CONTRIBUTING.md).
* [ ] I am reasonably sure this is a genuine bug in this repository's code and most likely not a user error. (If you run into an error and do not know the cause, please submit a "Trouble" issue instead.)

## Description

Please describe the bug.

## Reproducible example

Provide a minimal reproducible example with code and output that demonstrates the problem. The `reprex()` function from the [`reprex`](https://github.com/tidyverse/reprex) package is extremely helpful for this.

To help us read your code, please follow the [tidyverse style guide](https://style.tidyverse.org/). The `style_text()` and `style_file()` functions from the [`styler`](https://github.com/r-lib/styler) package make it easier.

## Expected result

What should have happened? Please be as specific as possible.

## Diagnostic information

* A [reproducible example](https://github.com/tidyverse/reprex).
* Session info, available through `sessionInfo()` or [`reprex(si = TRUE)`](https://github.com/tidyverse/reprex).
* A stack trace from `traceback()` or `rlang::trace_back()`.
* The [SHA-1 hash](https://git-scm.com/book/en/v1/Getting-Started-Git-Basics#Git-Has-Integrity) of the GitHub commit of `targets` currently installed. `packageDescription("targets")$GithubSHA1` shows you this.
