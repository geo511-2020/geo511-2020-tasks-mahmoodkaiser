library(raster)
library(sp)
library(spData)
library(tidyverse)
library(sf)
library(ncdf4)

#Load all data
data(world)
download.file("https://crudata.uea.ac.uk/cru/data/temperature/absolute.nc","crudata.nc")
tmax_monthly <- getData(name = "worldclim", var="tmax", res=10)
gain(tmax_monthly)=.1 # used coconn41's code to get right decimal value
tmean=raster("crudata.nc")

#step:1 Prepare country polygon data
#1.Remove "Antarctica" with filter() because WorldClim does not have data there.
world_new = world %>%
  filter(continent != "Antarctica")
#2.Convert the world object to sp format
world_sp = as(world_new, "Spatial")

#Annual max temoerature and tmax
tmax_annual=max(tmax_monthly)
names(tmax_annual) = "tmax"

#Calculate the maximum temperature observed in each country
#convert the results of the previous step to sf format 
country_max_each <-st_as_sf(raster::extract(tmax_annual,world_new,fun=max,na.rm=T, small=T, sp=T))

#Plotting map
map_hottest <- ggplot(country_max_each)+
  geom_sf(aes(fill=tmax))+
  scale_fill_viridis_c(name="Annual\nMaximum\nTemperature (C)")+
  theme(legend.position = 'bottom')

plot(map_hottest)


#droping the geometry column
country_each_cont <- st_set_geometry(country_max_each,value = NULL)

#Finding hottest country on each continent
country_each_cont <- country_each_cont%>%
  select(name_long,continent,tmax)%>%
  group_by(continent)%>%
  top_n(1)%>% #Zixuan helped me to understand how it works
  arrange(desc(tmax))

print(country_each_cont)
