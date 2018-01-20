## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE--------------------------------------------------------
#  dplyr::mutate(x = 1,
#                v1 = x,
#                x = x + 1,
#                v2 = x,
#                x = x + 1,
#                v3 = x)

## ------------------------------------------------------------------------
library("dplyr")
packageVersion("dplyr")

d <- data.frame(z = 1)

d %>%
  mutate(x = 1,
         v1 = x,
         x = x + 1,
         v2 = x,
         x = x + 1,
         v3 = x) %>%
  knitr::kable()

## ------------------------------------------------------------------------
packageVersion("dbplyr")
packageVersion("DBI")
packageVersion("RSQlite")

db <- DBI::dbConnect(RSQLite::SQLite(), 
                     ":memory:")
d2 <- dplyr::copy_to(db, d, 'd2')

d2 %>%
  mutate(x = 1,
         v1 = x,
         x = x + 1,
         v2 = x,
         x = x + 1,
         v3 = x) %>%
  collect() %>%
  knitr::kable()

## ---- comment=""---------------------------------------------------------
d2 %>%
  mutate(x = 1,
         v1 = x,
         x = x + 1,
         v2 = x,
         x = x + 1,
         v3 = x) %>%
  show_query()

## ------------------------------------------------------------------------
# # seplyr::factor_mutate() currently 
# # requires the dev-version of seplyr
# # version 0.5.2 or better.
# devtools::install_github("WinVector/seplyr")
stmts <- seplyr::factor_mutate(
  x = 1,
  v1 = x,
  x = x + 1,
  v2 = x,
  x = x + 1,
  v3 = x
)

## ---- comment=""---------------------------------------------------------
cat(stmts)

## ------------------------------------------------------------------------
eval(parse(text = paste("d2 %>%", stmts))) %>%
  collect() %>%
  knitr::kable()

## ----cleanup-------------------------------------------------------------
DBI::dbDisconnect(db)

