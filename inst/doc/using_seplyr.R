## ----exi-----------------------------------------------------------------
suppressPackageStartupMessages(library("dplyr"))
packageVersion("dplyr")

cat(colnames(starwars), sep = '\n')

starwars %>%
  group_by(homeworld) %>%
  summarise(mean_height = mean(height, na.rm = TRUE),
            mean_mass = mean(mass, na.rm = TRUE),
            count = n())

## ----exc-----------------------------------------------------------------
library("seplyr")

starwars %>%
  group_by_se("homeworld") %>%
  summarize_se(c("mean_height" := "mean(height, na.rm = TRUE)",
                 "mean_mass" := "mean(mass, na.rm = TRUE)",
                 "count" := "n()"))

## ----exp1----------------------------------------------------------------
starwars_mean <- function(my_var) {
  starwars %>%
    group_by_se(my_var) %>%
    summarize_se(c("mean_height" := "mean(height, na.rm = TRUE)",
                   "mean_mass" := "mean(mass, na.rm = TRUE)",
                   "count" := "n()"))
}

starwars_mean("hair_color")

## ----exp3----------------------------------------------------------------
grouped_mean <- function(data, 
                         grouping_variables, 
                         value_variables) {
  result_names <- paste0("mean_", 
                         value_variables)
  expressions <- paste0("mean(", 
                        value_variables, 
                        ", na.rm = TRUE)")
  calculation <- result_names := expressions
  print(as.list(calculation)) # print for demonstration
  data %>%
    group_by_se(grouping_variables) %>%
    summarize_se(c(calculation,
                   "count" := "n()"))
}

starwars %>% 
  grouped_mean(grouping_variables = "eye_color",
               value_variables = c("mass", "birth_year"))

