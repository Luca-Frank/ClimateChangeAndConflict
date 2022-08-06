library(tidyverse)
library(sf)
library(terra)

#All Information about this data set is in Population Codebook (data/AfricaPopulation)

#Populatin Density 2020
#load data from here: https://data.worldpop.org/GIS/Population/Whole_Continent/Africa_1km_Population/AFR_PPP_2020_adj_v2.tif
density  = raster("data/AfricaPopulation/AFR_PPP_2020_adj_v2.tif")

#load density for the year 2015
#load 2015 data from here: https://data.worldpop.org/GIS/Population/Whole_Continent/Africa_1km_Population/AFR_PPP_2015_adj_v2.tif
density15 = raster("data/AfricaPopulation/AFR_PPP_2015_adj_v2.tif")

#import the states data
states <- read_sf("data/states/ne_10m_admin_1_states_provinces.shp")

#aggregate the raster data by the factor 10 to shorten the run time
density = aggregate(density, fact=10)

#actual extraction of the density with the terrra package 
density <- terra::extract(density,states,fun=mean, touches=TRUE,na.rm=TRUE)

# # save the calculated density for the state level to work with in the .rmd file
write.csv(density, "density.csv", row.names=FALSE, quote=FALSE)



#load density for the year 2015
density15 = raster("data/AfricaPopulation/AFR_PPP_2015_adj_v2.tif")
density15 = aggregate(density15,fact=10)
density15 <- terra::extract(density15,states,fun=mean, touches=TRUE,na.rm=TRUE)
#rename density
write.csv(density15,"density15.csv")