library(spData)
library(sf)
library(tidyverse)
library(units) #this one is optional, but can help with unit conversions.

data(world)  
data(us_states)

#plot(world[1])  #plot if desired
#plot(us_states[1]) #plot if desired

#transform to the albers equal area projection:
albers="+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"
world_transform <- st_transform(world, crs = albers) #help


Canada <- world_transform %>%
  filter(name_long == "Canada")

#buffer canada to 10km (10000m)
Canada_buffer <- Canada %>%
  st_buffer(10000) 

#transform to the albers equal area projection defined above as albers
us_transform <- st_transform(us_states, crs = albers)

#filter the us_states dataset to include only NAME == "New York"
New_york <- us_transform %>%
  filter(NAME == "New York")

#use st_intersection() to intersect the canada buffer with New York (this will be your final polygon)
border_ny_ca <-  st_intersection(Canada_buffer, New_york)

#Plot the border area using ggplot() and geom_sf().
ggplot()+
  geom_sf(data=New_york)+
  geom_sf(data=border_ny_ca,fill="red")+
  labs(title = "New York Land within 10km")
ggsave("Case_study_5.png", width = 17, height = 10, units = "cm") 

#use st_area() to calculate the area of this polygon.
poly_area <- st_area(border_ny_ca) %>%
  set_units(km^2)

print(poly_area)
