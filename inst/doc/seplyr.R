## ----ex1a----------------------------------------------------------------
suppressPackageStartupMessages(library("dplyr"))

datasets::mtcars %>% 
  group_by(cyl, gear) %>% 
  head()

## ----ex1b----------------------------------------------------------------
groupingVars <- c('cyl', 'gear') # assume this is set elsewhere

datasets::mtcars %>% 
  group_by(!!!rlang::syms(groupingVars)) %>% 
  head()

## ----ex1c----------------------------------------------------------------
library("seplyr")

datasets::mtcars %>% 
  group_by_se(groupingVars) %>% 
  head()

## ----pex1d---------------------------------------------------------------
print(group_by_se)

