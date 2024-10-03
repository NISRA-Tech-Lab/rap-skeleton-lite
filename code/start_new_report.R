# Run by pressing Ctrl + Alt + R
# Or select all code and press Ctrl + Enter to run
# Complete the prompt which appears in the R Console below

if (!require(here)) install.packages("here")
library(here)

source(paste0(here(), "/code/config.R"))

f_new_report()