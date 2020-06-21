---
name: Trouble
about: You are struggling with a use case, and you are requesting help.
title: ""
labels: "type: trouble"
---

## Prework

* [ ] I understand and agree to this repository's [code of conduct](https://github.com/wlandau/targets-minimal/blob/master/CODE_OF_CONDUCT.md).
* [ ] I understand and agree to `targets`' [contributing guidelines](https://github.com/wlandau/targets-minimal/blob/master/CONTRIBUTING.md).

## Description

Describe the trouble clearly and concisely. The following three-paragraph format is preferred.

1. State the obstacle in 1-2 matter-of-fact high-level sentences.
2. Explain supporting context and details necessary to understand paragraph 1.
3. Suggest solutions, implementation details, or other ideas if you have them.

## Reproducible example

Provide a minimal reproducible example with code and output that demonstrates the problem. The `reprex()` function from the [`reprex`](https://github.com/tidyverse/reprex) package is extremely helpful for this.

To help us read your code, please try to follow the [tidyverse style guide](https://style.tidyverse.org/). The `style_text()` and `style_file()` functions from the [`styler`](https://github.com/r-lib/styler) package make it easier.

## Desired result

What output or behavior do you want to see? Please be as specific as you can.

## Diagnostic information

* A [reproducible example](https://github.com/tidyverse/reprex).
* Session info, available through `sessionInfo()` or [`reprex(si = TRUE)`](https://github.com/tidyverse/reprex).
* A stack trace from `traceback()` or `rlang::trace_back()`.
* The [SHA-1 hash](https://git-scm.com/book/en/v1/Getting-Started-Git-Basics#Git-Has-Integrity) of the GitHub commit of `targets` currently installed. `packageDescription("targets")$GithubSHA1` shows you this.

