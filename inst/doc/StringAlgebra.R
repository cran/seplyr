## ----stra1---------------------------------------------------------------
library("seplyr")

ratio <- 2
compCol1 <- "Sepal.Width"
expr <- expand_expr("Sepal.Length" >= ratio * compCol1)
print(expr)

## ----expr2---------------------------------------------------------------
expand_expr("Sepal.Length" >= "ratio" * compCol1)

## ----mu1-----------------------------------------------------------------
resCol1 <- "Sepal_Long"

datasets::iris %.>%
  mutate_se(., 
            resCol1 := expr) %.>%
  head(.)

## ----mu2-----------------------------------------------------------------
datasets::iris %.>%
  mutate_nse(., 
             resCol1 := "Sepal.Length" >= ratio * compCol1) %.>%
  head(.)

## ----mu3-----------------------------------------------------------------
"is_setosa" := expand_expr(Species == "'setosa'")
datasets::iris %.>%
  transmute_nse(., 
             "is_setosa" := Species == "'setosa'") %.>%
  summary(.)

## ----f1------------------------------------------------------------------
countMatches <- function(data, columnName, targetValue) {
  # extra quotes to say we are interested in value, not de-reference
  targetSym <- paste0('"', targetValue, '"') 
  data %.>%
    transmute_nse(., "match" := columnName == targetSym) %.>%
    group_by_se(., "match") %.>%
    summarize_se(., "count" := "n()")
}

countMatches(datasets::iris, "Species", "setosa")

