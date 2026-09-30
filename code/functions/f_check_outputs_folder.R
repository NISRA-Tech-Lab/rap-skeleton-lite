f_check_outputs_folder <- function() {
  folder_name <- here("outputs")

  if (!dir.exists(folder_name)) {
    dir.create(folder_name)
  }
}
