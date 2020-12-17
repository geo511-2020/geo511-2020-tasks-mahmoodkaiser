library(tidyverse)
library(nycflights13)

#flights  #to see flights dataset
#airports #to see airport dataset

flights_farthest <- arrange(flights, desc(distance)) %>%
left_join(airports, c("dest" = "faa"))
print(flights_farthest$name[1])
