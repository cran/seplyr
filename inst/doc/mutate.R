## ----check---------------------------------------------------------------
go <- requireNamespace("DBI", quietly = TRUE) &&
  requireNamespace("RSQLite", quietly = TRUE)

## ----dplyr, error=TRUE---------------------------------------------------
if(go) {
  suppressPackageStartupMessages(library("dplyr"))
  packageVersion("dplyr")
  
  db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  d <- copy_to(db, data.frame(a = 1))
  
  # works
   d %>% 
    mutate(a2 := a, a3 := a2) %>%
    show_query()
  d %>% 
    mutate(a2 := a, a3 := a2) %>%
    print()
  
  # fails
   d %>% 
    mutate(a2 := a, a3 := a2, a4 := a3) %>%
    show_query()
  d %>% 
    mutate(a2 := a, a3 := a2, a4 := a3) %>%
    print()
}

## ----seplyr--------------------------------------------------------------
if(go) {
  library("seplyr")
  packageVersion("seplyr")
  
  # works
   d %>% 
    mutate_nse(a2 := a, a3 := a2, a4 := a3) %>%
    show_query()
  d %>% 
    mutate_nse(a2 := a, a3 := a2, a4 := a3) %>%
    print()
}

