library(tidyverse)
library(reprex)
library(sf)
library(ggplot2)

library(spData)
data(world)

plot1 <- ggplot(world,aes(x=gdpPercap, fill=continent)) +
  geom_density(alpha=0.5,color=F) +
  labs(x= "GDP Per Capita",
       y= "Density",
       fill = "Contient") +
  theme(legend.position = "bottom")
ggsave("CS_7_plot.png", width = 17, height = 10, units = "cm")
plot1
