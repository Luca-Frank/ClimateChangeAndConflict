library(tidyverse)
library(sf)


#Instructions here
#https://github.com/wri/aqueduct30_data_download/blob/master/metadata.md
#Full data set here
#https://wri-projects.s3.amazonaws.com/Aqueduct30/finalData/Y2019M07D12_Aqueduct30_V01.zip

#load in the annual water stress data
aqua <- read_sf("data/Aqueduct/y2019m07d11_aqueduct30_annual_v01.gpkg")

#load african countries ISO/NAME_0
africa <- read_csv("data/africa/Africa_boundaries.csv")

africa_code <- africa %>%
  mutate(africa = TRUE) %>%
  dplyr::select(ISO,africa)

#filtering for africa and selecting only needed variables
aqua <- aqua %>% inner_join(africa, by=c("name_0"="NAME_0"))%>% 
  dplyr::select(bws_score,bwd_score,drr_score,rfr_score,w_awr_agr_tot_score)

aqua1 <- aqua %>% slice(1:6000)
aqua2 <- aqua %>% slice(6001:nrow(aqua))

#safe as sf object (.gpkg)
st_write(aqua1,"data/Aqueduct/aqua1.gpkg")
st_write(aqua2,"data/Aqueduct/aqua2.gpkg")
