source(
  here("code", "config.R")
)

# Load data
df_myes <- read.csv(
  here(
    "images",
    paste0(
      "local-government-districts-by-single-year-of-age-",
      "and-gender-mid-2001-to-mid-2022.csv"
    )
  )
)

names(df_myes) <- tolower(names(df_myes))

# Create variables for use in code and R Markdown
earliest_year <- min(df_myes$mid_year_ending)
latest_year <- max(df_myes$mid_year_ending)

# Population totals by year and gender
df_mye_year_gender_t <- df_myes |>
  group_by(
    mid_year_ending,
    gender
  ) |>
  summarise(
    ni_pop_total = sum(population_estimate),
    .groups = "drop"
  ) |>
  pivot_wider(
    names_from = gender,
    values_from = ni_pop_total
  )
