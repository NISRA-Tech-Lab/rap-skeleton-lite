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