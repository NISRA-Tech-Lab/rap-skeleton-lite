# Colour/logo options: ####

#  nics_theme - can be any of teo, daera, dfc, de, dfe, dof, dfi, doh, doj, bso

nics_theme <- "dof"

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

source(paste0(here(), "/code/Functions/functions.R"))

# Set the report title, NISRA logo and alternative text

nisra_logo <- encodeURIComponent(paste0(
  here(),
  "/images/Bilingual white logo.svg"
))

nisra_alt <- "NISRA logo"

# Departmental logo, alternative text and link to the department website

dep_logo <- base64enc::dataURI(file = paste0(
  here(), "/images/dept_logos/logo-white-",
  nics_theme, ".png"
))

dep_alt <- paste(toupper(nics_theme), "logo")

departmental_link <- if (!exists("nics_theme")) {
  departmental_link <- NULL
} else if (nics_theme == "dof") {
  departmental_link <- "https://www.finance-ni.gov.uk/topics/statistics-and-
  research-0"
} else if (nics_theme == "teo") {
  departmental_link <- "https://www.executiveoffice-ni.gov.uk/articles/national-
  statistics-protocol-and-compliance"
} else if (nics_theme == "daera") {
  departmental_link <- "https://www.daera-ni.gov.uk/landing-pages/statistics"
} else if (nics_theme == "dfc") {
  departmental_link <- "https://www.communities-ni.gov.uk/topics/dfc-statistics-and-research"
} else if (nics_theme == "de") {
  departmental_link <- "https://www.education-ni.gov.uk/topics/statistics-and-research/statistics#:~:text=Compendium%20of%20Northern%20Ireland%20education%20statistics."
} else if (nics_theme == "dfe") {
  departmental_link <- "https://www.economy-ni.gov.uk/topics/statistics-and-economic-research#:~:text=This%20page%20contains%20statistics,%20research%20and"
} else if (nics_theme == "dfi") {
  departmental_link <- "https://www.infrastructure-ni.gov.uk/topics/dfi-statistics-and-research#:~:text=Statistics%20and%20research%20on%20active%20and"
} else if (nics_theme == "doh") {
  departmental_link <- "https://www.health-ni.gov.uk/topics/doh-statistics-and-research#:~:text=DoH%20Statistics%20and%20Research.%20Information%20&"
} else if (nics_theme == "doj") {
  departmental_link <- "https://www.justice-ni.gov.uk/topics/doj-statistics-and-research#:~:text=Consisting%20of%20statisticians,%20on%20loan%20from"
} else if (nics_theme == "bso") {
  departmental_link <- "https://bso.hscni.net/"
} else {
  departmental_link <- NULL
}
