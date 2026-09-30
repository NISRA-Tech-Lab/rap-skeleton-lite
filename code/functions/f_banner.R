# ##############################################################################
# f_banner.R
# Creates HTML banner header for statistical reports with department logos and
# NISRA branding based on department
# #############################################################################

departmental_links <- c(
  dof = "https://www.finance-ni.gov.uk/",
  teo = "https://www.executiveoffice-ni.gov.uk/",
  daera = "https://www.daera-ni.gov.uk/",
  dfc = "https://www.communities-ni.gov.uk/",
  de = "https://www.education-ni.gov.uk/",
  dfe = "https://www.economy-ni.gov.uk/",
  dfi = "https://www.infrastructure-ni.gov.uk/",
  doh = "https://www.health-ni.gov.uk/",
  doj = "https://www.justice-ni.gov.uk/",
  bso = "https://bso.hscni.net/",
  adr = paste0(
    "https://www.adruk.org/about-us/",
    "working-as-a-partnership-is-fundamental-to-the-success-of-adr-uk/",
    "adr-northern-ireland/"
  )
)

if (
  exists("nics_theme") &&
    nics_theme %in% names(departmental_links)
) {
  departmental_link <- unname(
    departmental_links[nics_theme]
  )
} else {
  departmental_link <- NULL
}

f_banner <- function(
  title,
  subtitle = ""
) {
  htmltools::div(
    htmltools::div(
      style = paste0(
        "background-color: var(--nics-banner-borderline-colour-2); ",
        "height: 9px; ",
        "width: 100%;"
      )
    ),
    htmltools::div(
      style = paste0(
        "background-color: var(--nics-banner-borderline-colour-1); ",
        "padding: 10px;"
      ),
      htmltools::div(
        class = "grid mtb",
        htmltools::div(
          style = paste0(
            "display: flex; ",
            "justify-content: left; ",
            "align-items: center;"
          ),
          htmltools::a(
            href = "https://nisra.gov.uk",
            htmltools::img(
              src = nisra_logo,
              alt = "NISRA logo",
              width = "220px"
            )
          )
        ),
        htmltools::div(
          style = paste0(
            "display: flex; ",
            "justify-content: right; ",
            "align-items: bottom;"
          ),
          htmltools::a(
            href = departmental_link,
            htmltools::img(
              src = dep_logo,
              alt = dep_alt,
              width = "200px"
            )
          )
        )
      ),
      htmltools::div(
        style = paste0(
          "display: flex; ",
          "justify-content: center; ",
          "text-align: center;"
        ),
        htmltools::h1(
          style = paste0(
            "color: #ffffff; ",
            "font-size: 30px; ",
            "text-transform: capitalize;"
          ),
          class = "toc-ignore",
          title
        )
      ),
      htmltools::div(
        style = paste0(
          "font-size: 18px; ",
          "color: #ffffff; ",
          "display: flex; ",
          "justify-content: center; ",
          "text-align: center;"
        ),
        subtitle
      )
    ),
    htmltools::div(
      style = paste0(
        "background-color: var(--nics-banner-borderline-colour-3); ",
        "height: 9px; ",
        "width: 100%;"
      )
    ),
    htmltools::div(
      style = paste0(
        "width: 60%; ",
        "padding-left: 15px; ",
        "font-size: 120%;"
      ),
      htmltools::p(
        htmltools::strong("Last updated: "),
        last_updated_formatted
      )
    )
  )
}
