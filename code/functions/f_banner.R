if (!exists("nics_theme")) {
  departmental_link <- NULL
} else if (nics_theme == "dof") {
  departmental_link <- "https://www.finance-ni.gov.uk/"
} else if (nics_theme == "teo") {
  departmental_link <- "https://www.executiveoffice-ni.gov.uk/"
} else if (nics_theme == "daera") {
  departmental_link <- "https://www.daera-ni.gov.uk/"
} else if (nics_theme == "dfc") {
  departmental_link <- "https://www.communities-ni.gov.uk/"
} else if (nics_theme == "de") {
  departmental_link <- "https://www.education-ni.gov.uk/"
} else if (nics_theme == "dfe") {
  departmental_link <- "https://www.economy-ni.gov.uk/"
} else if (nics_theme == "dfi") {
  departmental_link <- "https://www.infrastructure-ni.gov.uk/"
} else if (nics_theme == "doh") {
  departmental_link <- "https://www.health-ni.gov.uk/"
} else if (nics_theme == "doj") {
  departmental_link <- "https://www.justice-ni.gov.uk/"
} else if (nics_theme == "bso") {
  departmental_link <- "https://bso.hscni.net/"
} else if (nics_theme == "adr") {
  departmental_link <- "https://www.adruk.org/about-us/working-as-a-partnership-is-fundamental-to-the-success-of-adr-uk/adr-northern-ireland/"
} else {
  departmental_link <- NULL
}

f_banner <- function(title, subtitle = "") {
  div(
    div(
      style = "background-color: var(--nics-banner-bg); padding: 10px",
      div(
        class = "grid mtb",
        div(style = "display: flex; justify-content: left;
            align-items: center;",
            a(href = "https://nisra.gov.uk",
              img(src = nisra_logo,
                  alt = "NISRA logo",
                  width = "220px"
              )
            )
        ),
        div(style = "display: flex; justify-content: right;
          align-items: bottom;",
            a(href = departmental_link,
              img(src = dep_logo,
                  alt = dep_alt,
                  width = "200px"
              )
            )
        )
      ),
      div(
        style = "display: flex; justify-content: center; text-align: center;",
        h1(style = "color: #ffffff; font-size: 30px;
            text-transform: capitalize;", class = "toc-ignore", title)
      ),
      div(
        style = "font-size: 18px; color: #ffffff; display: flex;
          justify-content: center;  text-align: center;", subtitle)
    ),
    div(
      style = paste0("background-color: var(--nics-banner-highlight);
                       height: 9px; width: 100%;")
    ),
    div(
      style= "Width: 60%; padding-left:15px; font-size: 120%",
      p(strong("Last updated: "), last_updated_formatted))
  )
}