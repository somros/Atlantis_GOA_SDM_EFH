# read in packages

library(tidyverse)
library(raster)
library(sf)
library(rbgm)
library(viridis)
library(rnaturalearth)

select <- dplyr::select

area <- "AI" # one of GOA and AI

all_dirs <- list.dirs(path = paste0("./", area, "_2017"), full.names = FALSE, recursive = FALSE)

this_path <- paste0(area, "_2017/") # to use in the markdown

# read in the bgm 
atlantis_bgm <- read_bgm("GOA_WGS84_V4_final.bgm")
atlantis_sf <- atlantis_bgm %>% box_sf()

# read in the coastline
coast <- ne_countries(country = "United States of America", scale = "medium") # pull country ouitlines from Natural Earth


for(i in 1:length(all_dirs)) {
  instance <- all_dirs[i]
  rmarkdown::render(
    'EFH_to_Atlantis.Rmd', output_file = paste0(paste("knitted_outputs", area, sep = "/" ), '/', instance, '.html')
  )
}