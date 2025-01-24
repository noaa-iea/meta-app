if (!require(librarian)){
  install.packages("librarian")
  library(librarian)
}
shelf(
  dplyr, DT, 
  noaa-iea/ecoidx, 
  fs, glue, googleAuthR, here, plotly, readr, shiny)

#devtools::load_all("~/github/noaa-iea/ecoidx")

# read all csv files as tables
tbl_csvs <- list.files(here("data"), "csv$", full.names = T)
for (csv in tbl_csvs){
  tbl <- path_ext_remove(basename(csv))
  d   <- read_csv(csv, col_types = cols())
  assign(tbl, d, envir = globalenv())
  rm(csv, tbl, d)
}