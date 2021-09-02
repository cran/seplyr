## ----exc----------------------------------------------------------------------
library("dplyr")

## -----------------------------------------------------------------------------
library("seplyr")

## -----------------------------------------------------------------------------
starwars %>%
  group_by_se("homeworld") %>%
  summarize_se(c("mean_height" := "mean(height, na.rm = TRUE)",
                 "mean_mass" := "mean(mass, na.rm = TRUE)",
                 "count" := "n()"))

## ----exp3---------------------------------------------------------------------
grouped_mean <- function(data, 
                         grouping_variables, 
                         value_variables,
                         count_name = "count") {
  result_names <- paste0("mean_", 
                         value_variables)
  expressions <- paste0("mean(", 
                        value_variables, 
                        ", na.rm = TRUE)")
  calculation <- result_names := expressions
  data %>%
    group_by_se(grouping_variables) %>%
    summarize_se(c(calculation,
                   count_name := "n()")) %>%
    ungroup()
}

starwars %>% 
  grouped_mean(grouping_variables = c("eye_color", "skin_color"),
               value_variables = c("mass", "birth_year"))

