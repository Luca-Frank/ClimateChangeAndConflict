library(tidyverse)
library(sf)

#download data from NASA EarthData
#https://sedac.ciesin.columbia.edu/data/set/food-food-insecurity-hotspots
# additional information in (data/foodinsecurity) in the documentation 

#-------------------FOOD INSECURITY 2015 ------------------------------------
#read data
food_security15_1 <- read_sf("data/foodinsecurity/food-food-insecurity-hotspots_201501_geographic.shp")
food_security15_2 <- read_sf("data/foodinsecurity/food-food-insecurity-hotspots_201504_geographic.shp")
food_security15_3 <- read_sf("data/foodinsecurity/food-food-insecurity-hotspots_201507_geographic.shp")
food_security15_4 <- read_sf("data/foodinsecurity/food-food-insecurity-hotspots_201510_geographic.shp")

#only select row number
dis_name <- dis %>% 
  dplyr::select(ID)

#get the state value with st_join(join=overlaps,largest=True) that looks for the largest overlap and assigns this value to state
dis_sec <- st_join(dis_name,food_security15_1,join=st_overlaps,left=TRUE,largest=TRUE)

dis_sec <- st_join(dis_sec,food_security15_2,join=st_overlaps,left=TRUE,largest=TRUE)

dis_sec <- st_join(dis_sec,food_security15_3,join=st_overlaps,left=TRUE,largest=TRUE)

dis_sec <- st_join(dis_sec,food_security15_4,join=st_overlaps,left=TRUE,largest=TRUE)

names(dis_sec)
dis_sec <- dis_sec %>%
  rename(cs1 = CS.x) %>%
  rename(cs2 = CS.y) %>%
  rename(cs3 = CS.x.1) %>%
  rename(cs4 = CS.y.1) %>%
  dplyr::select(ID,cs1,cs2,cs3,cs4)

# dis_sec <- dis_sec %>%
#   rename(cs1 = CS.x...3) %>%
#   rename(cs2 = CS.y...5) %>%
#   rename(cs3 = CS.x...7) %>%
#   rename(cs4 = CS.y...9) %>%
#   dplyr::select(ID,cs1,cs2,cs3,cs4)

dis_sec <- dis_sec %>%
  mutate(sec15 = (cs1+cs2+cs3+cs4)/4) %>%
  mutate(sec15= ifelse(sec15 > 5,NA,sec15))

#-------------------FOOD INSECURITY 2016 ------------------------------------
food_security16_1 <- read_sf("data/foodinsecurity/food-food-insecurity-hotspots_201602_geographic.shp")
food_security16_2 <- read_sf("data/foodinsecurity/food-food-insecurity-hotspots_201606_geographic.shp")
food_security16_3 <- read_sf("data/foodinsecurity/food-food-insecurity-hotspots_201610_geographic.shp")

#get the state value with st_join(join=overlaps,largest=True) that looks for the largest overlap and assigns this value to state
dis_sec <- st_join(dis_sec,food_security16_1,join=st_overlaps,left=TRUE,largest=TRUE)

dis_sec <- st_join(dis_sec,food_security16_2,join=st_overlaps,left=TRUE,largest=TRUE)

dis_sec <- st_join(dis_sec,food_security16_3,join=st_overlaps,left=TRUE,largest=TRUE)


dis_sec <- dis_sec %>%
  rename(cs61 = CS.x) %>%
  rename(cs62 = CS.y) %>%
  rename(cs63 = CS)  

dis_sec <- dis_sec %>%
  mutate(sec16 = (cs61+cs62+cs63)/3) %>%
  mutate(sec16= ifelse(sec16 > 5,NA,sec16)) %>%
  dplyr::select(ID,sec15,sec16)

#-------------------FOOD INSECURITY 2017 ------------------------------------
food_security17_1 <- read_sf("data/foodinsecurity/food-food-insecurity-hotspots_201702_geographic.shp")
food_security17_2 <- read_sf("data/foodinsecurity/food-food-insecurity-hotspots_201706_geographic.shp")
food_security17_3 <- read_sf("data/foodinsecurity/food-food-insecurity-hotspots_201710_geographic.shp")


#get the state value with st_join(join=overlaps,largest=True) that looks for the largest overlap and assigns this value to state
dis_sec <- st_join(dis_sec,food_security17_1,join=st_overlaps,left=TRUE,largest=TRUE)

dis_sec <- st_join(dis_sec,food_security17_2,join=st_overlaps,left=TRUE,largest=TRUE)

dis_sec <- st_join(dis_sec,food_security17_3,join=st_overlaps,left=TRUE,largest=TRUE)


dis_sec <- dis_sec %>%
  rename(cs1 = CS.x) %>%
  rename(cs2 = CS.y) %>%
  rename(cs3 = CS)  

dis_sec <- dis_sec %>%
  mutate(sec17 = (cs1+cs2+cs3)/3) %>%
  mutate(sec17= ifelse(sec17 > 5,NA,sec17)) %>%
  dplyr::select(ID,sec15,sec16,sec17)

#-------------------FOOD INSECURITY 2014 ------------------------------------
food_security14_1 <- read_sf("data/foodinsecurity/food-food-insecurity-hotspots_201401_geographic.shp")
food_security14_2 <- read_sf("data/foodinsecurity/food-food-insecurity-hotspots_201404_geographic.shp")
food_security14_3 <- read_sf("data/foodinsecurity/food-food-insecurity-hotspots_201407_geographic.shp")
food_security14_4 <- read_sf("data/foodinsecurity/food-food-insecurity-hotspots_201410_geographic.shp")

#get the state value with st_join(join=overlaps,largest=True) that looks for the largest overlap and assigns this value to state
dis_sec <- st_join(dis_sec,food_security14_1,join=st_overlaps,left=TRUE,largest=TRUE)

dis_sec <- st_join(dis_sec,food_security14_2,join=st_overlaps,left=TRUE,largest=TRUE)

dis_sec <- st_join(dis_sec,food_security14_3,join=st_overlaps,left=TRUE,largest=TRUE)

dis_sec <- st_join(dis_sec,food_security14_4,join=st_overlaps,left=TRUE,largest=TRUE)

names(dis_sec)

names(dis_sec)
dis_sec <- dis_sec %>%
  rename(cs1 = CS.x) %>%
  rename(cs2 = CS.y) %>%
  rename(cs3 = CS.x.1) %>%
  rename(cs4 = CS.y.1) 

# dis_sec <- dis_sec %>%
#   rename(cs1 = CS.x...6) %>%
#   rename(cs2 = CS.y...8) %>%
#   rename(cs3 = CS.x...10) %>%
#   rename(cs4 = HA0.y...13) 

dis_sec <- dis_sec %>%
  mutate(sec14 = (cs1+cs2+cs3+cs4)/4) %>%
  mutate(sec14= ifelse(sec14 > 5,NA,sec14)) %>%
  dplyr::select(ID,sec14,sec15,sec16,sec17)

#remove geometry from the data to save...
st_geometry(dis_sec) <- NULL
#...as csv to import into the rmd
write.csv(dis_sec, "dis_sec.csv", row.names=FALSE, quote=FALSE)

