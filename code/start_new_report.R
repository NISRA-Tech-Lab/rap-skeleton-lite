# Run by pressing Ctrl + Alt + R
# Alternatively, select all code and press Ctrl + Enter
# Complete the prompt that appears in the R Console.

if (!require(here)) install.packages("here")
library(here)

source(
  here(
    "code",
    "config.R"
  )
)

f_new_report()
