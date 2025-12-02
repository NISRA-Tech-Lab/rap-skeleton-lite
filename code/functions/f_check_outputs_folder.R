f_check_outputs_folder <- function() {
  folder_name <- "outputs"
  
  if (!dir.exists(folder_name)) {
    dir.create(folder_name)
  }
}
