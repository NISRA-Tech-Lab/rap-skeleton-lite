# Colour/logo options: ####

# nics_theme - can be: teo, daera, dfc, de,dfe, dof, dfi, doh, doj, bso, adr
# Enter the department below in quotes. Use the exact match from the list above

nics_theme <- "dof"
bilingual <- TRUE

# INSTALL PACKAGES  ####
# check for presence of required packages and if necessary,
# install and then load each

# Set CRAN repository
local({
  r <- getOption("repos")
  r["CRAN"] <- "https://cran.rstudio.com/"
  r["CRANextra"] <- "https://cran.rstudio.com/"
  options(repos = r)
})

if (!require(pacman)) install.packages("pacman")
library(pacman)

packages <- c(
  "rmarkdown",
  "knitr",
  "dplyr",
  "kableExtra",
  "httpuv",
  "htmltools",
  "tidyr",
  "DT",
  "here"
)


for (p in packages) {
  if (!p_isinstalled(p)) {
    print(p)
    install.packages(p)
  }
  
  dependencies <- p_depends(p, character.only = TRUE)$Imports
  
  for (d in dependencies) {
    if (!p_isinstalled(d)) {
      print(d)
      install.packages(d)
    }
  }
  
  library(p, character.only = TRUE)
}

# Sources the Functions.R file

for (file in list.files(path = here("code/functions"))) {
  source(here("code/functions", file))
}

# Set the report title, NISRA logo and alternative text

# NISRA logo
if (bilingual == TRUE) {
  nisra_logo <-
    here("images/nisra-only-white.svg")
} else {
  nisra_logo <- here("images/nisra-only-white.svg")
}

nisra_logo <- paste0(
  "data:image/svg+xml,",
  readLines(nisra_logo) %>%
    paste(collapse = " ") %>%
    encodeURIComponent()
)

nisra_alt <- "NISRA logo, links to NISRA homepage"

# Departmental logo, alternative text and link to the department website

dep_logo <- encodeURIComponent(
  paste0(
    here(), "/images/dept_logos/logo-white-unstacked-",
    nics_theme, ".svg"
  )
)

dep_alt <- paste(
  toupper(nics_theme),
  "logo, links to ",
  toupper(nics_theme),
  "homepage"
  )

## Get date last updated time for the report

last_updated <- Sys.Date()
last_updated_formatted <- format(last_updated, "%d %B %Y")
