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
  
  # 1) Find the "## Introduction" line (first match)
  intro_ix <- which(trimws(demo_report) == "## Introduction")[1L]
  
  # 2) Find the footer chunk header line, e.g.
  # ```{r render-footer, results='asis', echo=FALSE}
  footer_ix <- grep("^```\\{r\\s*render-footer\\b", demo_report)[1L]
  
  # 3) Sanity checks so we fail with a clear message if markers are missing
  if (is.na(intro_ix)) {
    stop("Couldn't find '## Introduction' in rap_skeleton_lite_demo.Rmd")
  }
  
  if (is.na(footer_ix)) {
    stop("Couldn't find the 'render-footer' chunk in rap_skeleton_lite_demo.Rmd")
  }
  
  # Build the new report template
  report_template <- c(
    demo_report[seq_len(intro_ix)],  # from top to "## Introduction"
    "",
    "Start adding content here. Refer to the [RAP Skeleton Lite Demo](rap_skeleton_lite_demo.html) for code and formatting examples.",
    "",
    demo_report[footer_ix:length(demo_report)]  # from footer chunk to end
  )
  
  report_template <- report_template[!grepl("code_folding", report_template)]
  
  filename <- paste0(here(), "/code/",
                     gsub(" ", "-", report_title, fixed = TRUE), ".Rmd")
  
  writeLines(report_template, filename)
  
  file.edit(filename)
}