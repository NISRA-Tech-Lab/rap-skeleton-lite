f_new_bqr_report <- function() {
  report_title_bqr <- readline(prompt = "Enter title for new BQR report: ")
  
  demo_bqr_report <- readLines(paste0(here(),
                                      "/code/BQR_template.Rmd"))
  
  demo_bqr_report <- gsub("RAP Skeleton BQR Template",
                          report_title_bqr, demo_bqr_report)
  
  f_check_outputs_folder()
  
  if (!file.exists(paste0(here(),
                          "/outputs/BQR_template.html"))) {
    rmarkdown::render(
      input = paste0(here(),
                     "/code/BQR_template.Rmd"),
      output_file = paste0(here(),
                           "/outputs/BQR_template.html")
    )
  }
  
  filename <- paste0(here(), "/code/",
                     gsub(" ", "-", report_title_bqr, fixed = TRUE), ".Rmd")
  
  writeLines(demo_bqr_report, filename)
  
  file.edit(filename)
}