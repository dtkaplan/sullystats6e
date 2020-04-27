#  Read the Sullivan stats files
library(dplyr)
library(readr)



read_plain <- function(fname) {
  Contents <- suppressWarnings(
    readLines(paste0(fname))
  )
  vnames <- Contents[1] %>% gsub("\"", "", .)

  # get rid of commas
  Contents <-
        Contents[-1] %>%
          gsub("([0-9]),([0-9])", "\\1\\2",  .)

  if (all(grepl("\t",  Contents))) delim <- "\t"
  else delim <- " "

  the_names <-  unlist(strsplit(vnames, delim))
  Frame <- read_delim(file = Contents,  delim=delim, col_names = FALSE)

  if (inherits(Frame, "try-error"))
    Frame <- "Error reading  file"
  else {
    if (is.character(Frame)) Frame <- tibble(Frame)
    names(Frame) <- the_names[1:ncol(Frame)]
    Frame <- Frame[colSums(!is.na(Frame)) > 0]
  }

  Frame
}

read_directory_files <- function(dir_name) {
  fnames <-  dir(dir_name)
  fnames <-  fnames[grepl(".txt$", fnames)]

  Res <- lapply(paste0(dir_name,  fnames), read_plain)
  names(Res) <- paste0("S", gsub(".txt$",  "",  fnames))

  Res
}

directories <- paste0("inst/raw_data/Chapter_",  1:15, "/")

Goo <-  lapply(directories,  read_directory_files)

Hoo <- unlist(Goo, recursive = FALSE)


top_level <- dir("inst/raw_data", pattern=".txt")

Goo2 <- lapply(paste0("inst/raw_data/", top_level), read_plain)
names(Goo2)  <-  gsub(".txt$", "", top_level)


save_one  <- function(name, the_list) {
  target <-  paste0("data/", name, ".rda")
  assign(name, the_list[[name]])
  save(list=name, file = target)

  target
}

lapply(names(Hoo),  function(x) {save_one(x, Hoo)})
lapply(names(Goo2), function(x) {save_one(x,  Goo2)})
