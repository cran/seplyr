## ---- eval=FALSE--------------------------------------------------------------
#     install.packages('seplyr')

## ---- eval=FALSE--------------------------------------------------------------
#     devtools::install_github('WinVector/seplyr')

## ----ex1a---------------------------------------------------------------------
suppressPackageStartupMessages(library("dplyr"))
packageVersion("dplyr")

datasets::mtcars %>% 
  arrange(cyl, desc(gear)) %>% 
  head()

## ----ex1b---------------------------------------------------------------------
# Assume this is set elsewhere,
# supplied by a user, function argument, or control file.
orderTerms <- c('cyl', 'desc(gear)')

## ----ex1c---------------------------------------------------------------------
library("seplyr")

datasets::mtcars %.>% 
  arrange_se(., orderTerms) %>% 
  head(.)

## ----atexse-------------------------------------------------------------------
datasets::iris %.>%
  group_by_se(., "Species") %.>%
  summarize_se(., c("Mean.Sepal.Length" := "mean(Sepal.Length)", 
                    "Mean.Sepal.Width" := "mean(Sepal.Width)"))

