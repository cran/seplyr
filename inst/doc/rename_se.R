## ----rename1-------------------------------------------------------------
suppressPackageStartupMessages(library("dplyr"))

datasets::mtcars %>%
  rename(cylinders = cyl, gears = gear) %>%
  head()

## ----map1----------------------------------------------------------------
mp <- c("cyl" = "cylinders", "gear" = "gears")
print(mp)

## ----rename2-------------------------------------------------------------
library("seplyr")

datasets::mtcars %>%
  rename_se(c("cylinders" := "cyl", "gears" := "gear")) %>%
  head()

## ----rename3-------------------------------------------------------------
datasets::mtcars %>%
  rename_at(names(mp), function(si) { mp[si] }) %>%
  head()

## ----rename4-------------------------------------------------------------
datasets::mtcars %>%
  rename_mp(mp) %>%
  head()
