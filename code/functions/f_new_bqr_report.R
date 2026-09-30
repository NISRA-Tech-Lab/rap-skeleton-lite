f_new_bqr_report <- function() {
  report_title_bqr <- readline(
    prompt = "Enter title for new BQR report: "
  )

  demo_bqr_report <- readLines(
    here(
      "code",
      "BQR_template.Rmd"
    )
  )

  demo_bqr_report <- gsub(
    "RAP Skeleton BQR Template",
    report_title_bqr,
    demo_bqr_report
  )

  f_check_outputs_folder()

  if (!file.exists(
    here(
      "outputs",
      "BQR_template.html"
    )
  )) {
    rmarkdown::render(
      input = here(
        "code",
        "BQR_template.Rmd"
      ),
      output_file = here(
        "outputs",
        "BQR_template.html"
      )
    )
  }

  filename <- here(
    "code",
    paste0(
      gsub(
        " ",
        "-",
        report_title_bqr,
        fixed = TRUE
      ),
      ".Rmd"
    )
  )

  writeLines(
    demo_bqr_report,
    filename
  )

  file.edit(
    filename
  )
}
