library(here)

source(paste0(here(), "/code/config.R"))

df_myes <- read.csv(paste0(
  here(),
  "/images/local-government-districts-by-single-year-of-age-",
  "and-gender-mid-2001-to-mid-2022.csv"
))

names(df_myes) <- tolower(names(df_myes))

#### Creating variables for use in code and Rmd ####
earliest_year <- min(df_myes$mid_year_ending)
latest_year <- max(df_myes$mid_year_ending)

df_mye_year_gender_t <- df_myes %>%
  group_by(mid_year_ending, gender) %>%
  summarise(ni_pop_total = sum(population_estimate)) %>%
  pivot_wider(names_from = gender, values_from = ni_pop_total)
