library(tidyverse)
library(sf)
library(tmap)

# Loading shape file ------------------------------------------------------

th <- st_read("thai/THA_Adm1_GISTA_plyg_v5.shp")

gs <- read_csv("GS sales by province.csv")
th %>% 
  left_join(gs, by = c("Adm1Name"="province")) -> th_dealer

# For loop -----------------------------------------------------------

source("fn/map_fn.R")

region_list <- distinct(gs, region)
region_list <- region_list$region

for (i in region_list) {
  
  p <- mapping_region(th_dealer, i)
  
  tmap_save(p, paste0("output/", i,".pdf"))
  
}
