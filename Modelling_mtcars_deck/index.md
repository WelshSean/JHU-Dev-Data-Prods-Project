---
title       : Exploring mtcars With Slidify
subtitle    : 
author      : Sean Clarke
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax, shiny, interactive]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Overview

* mtcars is one of the test datasets that can be loaded into R
* It was extracted from the 1974 Motor trend US Magazine
* A useful, manageable dataset for exploration
* This application sets out to allow the user to evaluate linear models for mtcars
* It also allows the user to pick which of the covariants  are included in the model



--- .class #id 

## Features in the mtcars Dataset


```
## 'data.frame':	32 obs. of  11 variables:
##  $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
##  $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
##  $ disp: num  160 160 108 258 360 ...
##  $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
##  $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
##  $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
##  $ qsec: num  16.5 17 18.6 19.4 17 ...
##  $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
##  $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
##  $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
##  $ carb: num  4 4 1 1 2 1 4 2 2 4 ...
```

---

## Why build this Application?

* The application could serve as a useful learning aid for statistics students studying Linear Models
* Provides a convenient way to play with a linear model for people who are interested
* Provides a Minimal Viable Product(MVP) from which we could iterate to build a much more fully featured, useful application.

---



## The Problem that this application solves

The application solves the linear model problem using the lm function in R. \

The tickboxes can be used to build formula that the lm function expects of the form y ~ a+b+c. 

$$
y_{i} = \beta_{0} + \beta_{1}X_{i} \cdots  + \beta_{n}X_{n} + \epsilon
$$

The application supplies the user with $\beta_{0}, \beta{1} \cdots \beta_{n}$

---

## Further work

* Ability to select other models
* Ability to toggle verbose output to see errors, p-values, etc
* Ability to use model to carry out predictions.

---

## The App Itself

#```{r, echo = FALSE, cache=FALSE}
#library(shiny)
#shinyAppDir(
#  "/Users/Sean/Coursera_DataScience/JHU-Dev-Data-Prods-Project",
#  options=list(
#    width="100%", height=700
#  )
#)
#```

---
