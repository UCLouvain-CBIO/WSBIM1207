# WSBIM1207: Introduction to bioinformatics and data science

[![DOI](https://zenodo.org/badge/147494586.svg)](https://zenodo.org/badge/latestdoi/147494586)

Read the course at http://bit.ly/WSBIM1207

If you use this course, please cite it as

> Laurent Gatto, Kevin Missault, Manon Martin & Axelle Loriot. (2021,
> September 24). UCLouvain-CBIO/WSBIM1207: Introduction to
> bioinformatics (Version
> v2.0.0). Zenodo. DOI: 10.5281/zenodo.5532658

## License

This material is licensed under the [Creative Commons
Attribution-ShareAlike 4.0
License](https://creativecommons.org/licenses/by-sa/4.0/)/

## Contributions

Contributions to this material are welcome. The best way to contribute
or contact the maintainers is by means of pull requests and
issues. Please familiarise yourself with the [code of
conduct](https://github.com/UCLouvain-CBIO/WSBIM1207/blob/master/CONDUCT.md). By
participating in this project you agree to abide by its terms.

## Book setup

To build this book, you'll need
[bookdown](https://pkgs.rstudio.com/bookdown/) and a
[fork](https://github.com/lgatto/msmbstyle) of [`msmbstyle`
style](https://github.com/grimbough/msmbstyle/).


```{r combilebook1, eval=FALSE}
install.packages("bookdown")
devtools::install_github("lgatto/msmbstyle")
```

Once cloned, in the books work directory, type

```{r combilebook2, eval=FALSE}
bookdown::render_book(".")
```
