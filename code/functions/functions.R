f_borderline <- function() {
  div(
    div(class = "row", style = "display: flex; margin-top: 15px;
        margin-bottom: 10px"),
    div(class = "border", style = paste0(
      "background-color: var(--nics-three",
      "-bar-colour-1); float:left"
    )),
    div(class = "border", style = paste0(
      "background-color: var(--nics-three",
      "-bar-colour-2); float:left"
    )),
    div(class = "border", style = paste0(
      "background-color: var(--nics-three",
      "-bar-colour-3); float:right"
    )),
  )
}

f_banner <- function(title, subtitle = "") {
  div(
    div(
      style = "background-color: var(--nics-banner-bg); padding: 10px",
      div(
        class = "grid mtb",
        div(style = "display: flex; justify-content: center;
            align-items: center;", a(
              href = "https://nisra.gov.uk",
            img(
                src = nisra_logo,
                alt = "NISRA logo",
                width = "200px",
                height = "80px"
              )
            )),
        div(
          style = "display: flex; justify-content: center",
          a(
            href = departmental_link,
            img(src = dep_logo, alt = dep_alt, width = "200px")
          )
        )
      ),
      div(
        style = "display: flex; justify-content: center; text-align: center;",
        p(style = "color: #ffffff; font-size: 30px;
            text-transform: capitalize;", class = "toc-ignore", title)
      ),
      div(style = "font-size: 18px; color: #ffffff; display: flex;
          justify-content: center;  text-align: center;", subtitle)
    ),
    div(style = paste0("background-color: var(--nics-banner-highlight);
                       height: 9px; width: 100%;"))
  )
}

f_definition_box <- function(text = "") {
  div(
    div(
      class = "defboxes",
      text
    )
  )
}

f_footer <- function() {
  HTML('
<footer style="color: #ffffff; background-color: #00205b;">
  <div class="col-wide" data-analytics="footer">
    <div class="row" style = "display: flex;">
      <div class="column left">
        <footerheading>Links</footerheading>
        <ul>
          <li><a href="https://www.nisra.gov.uk/" 
          class="link" 
          style="color: #ffffff">NISRA</a></li>
          <li><a href="https://www.nidirect.gov.uk" 
          class="link" 
          style="color: #ffffff">NIDirect</a></li>
          <li><a href="https://www.gov.uk/" 
          class="link" 
          style="color: #ffffff">GOV.UK</a></li>
          <li><a href="https://data.nisra.gov.uk/" 
          class="link" 
          style="color: #ffffff">NISRA Data Portal</a></li>
          <li><a href="https://build.nisra.gov.uk/" 
          class="link" 
          style="color: #ffffff">Census Flexible Table Builder</a></li>
        </ul>
      </div>
      <div class="column right">
        <footerheading>Follow NISRA</h3></footerheading>
        <ul>
          <li><a href="https://www.facebook.com/nisra.gov.uk" 
          class="link" style="color: #ffffff">Facebook</a></li>
          <li><a href="https://twitter.com/NISRA" class="link" 
          style="color: #ffffff">X (Twitter)</a></li>
          <li><a href="https://www.youtube.com/user/nisrastats" 
          class="link" style="color: #ffffff">YouTube</a></li>
        </ul>
      </div>
    </div>
    <div class="flex-list">
      <ul>
        <li><a href="https://www.nisra.gov.uk/crown-copyright" 
        class="link" 
        style="color: #ffffff">&copy Crown Copyright</a></li>
        <li><a href="https://www.nisra.gov.uk/contact" 
        class="link" 
        style="color: #ffffff">Contact us</a></li>
        <li><a href="https://www.nisra.gov.uk/terms-and-conditions" 
        class="link" 
        style="color: #ffffff">Terms and conditions</a></li>
        <li><a href="https://www.nisra.gov.uk/cookies" 
        class="link" 
        style="color: #ffffff">Cookies</a></li>
        <li><a href="https://www.nisra.gov.uk/nisra-privacy-notice" 
        class="link" 
        style="color: #ffffff">Privacy</a></li>
        <li><a 
        href="https://datavis.nisra.gov.uk/dissemination/accessibility-statement-visualisations.html" 
        class="link" style="color: #ffffff">Accessibility Statement</a></li>
      </ul>
    </div>
  </div>
</footer>
')
}

f_new_report <- function() {
  report_title <- readline(prompt = "Enter title for new report: ")

  demo_report <- readLines(paste0(here(), "/code/rap_skeleton_lite_demo.Rmd"))

  demo_report <- gsub("RAP Skeleton Lite Demo", report_title, demo_report)

  f_check_outputs_folder()
  
  if (!file.exists(paste0(here(), "/outputs/rap_skeleton_lite_demo.html"))) {
    rmarkdown::render(
      input = paste0(here(), "/code/rap_skeleton_lite_demo.Rmd"),
      output_file = paste0(here(), "/outputs/rap_skeleton_lite_demo.html")
    )
  }

  report_template <- c(
    demo_report[1:which(demo_report == "## Introduction")],
    "",
    "Start adding content here. Refer to the [RAP Skeleton Lite Demo](rap_skeleton_lite_demo.html) for code and formatting examples.",
    "",
    demo_report[which(demo_report == "`r f_footer()`")[2]:length(demo_report)]
  )

  report_template <- report_template[!grepl("code_folding", report_template)]

  filename <- paste0(here(), "/code/",
                     gsub(" ", "-", report_title, fixed = TRUE), ".Rmd")

  writeLines(report_template, filename)

  file.edit(filename)
}

f_check_outputs_folder <- function() {
  folder_name <- "outputs"
  
  if (!dir.exists(folder_name)) {
    dir.create(folder_name)
  }
}
