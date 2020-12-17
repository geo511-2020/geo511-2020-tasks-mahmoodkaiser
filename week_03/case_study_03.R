library(gapminder)
library(ggplot2)
library(dplyr)

#viewing data
#gapminder

#removing Kuwait
gapminder <- gapminder %>%
  filter(country != "Kuwait")

#Plot 1
plot1 <- ggplot(gapminder, aes(lifeExp, gdpPercap, color = continent, size = pop/100000)) +
  geom_point() +
  scale_y_continuous(trans = "sqrt") +
  facet_wrap(~year, nrow = 1)+
  theme_bw() +
  labs(x = "Life Expectancy",y = "GDP per capita")
ggsave("Case_study_3_plot1.png", width = 17, height = 10, units = "cm")

print(plot1)

#Plot 2
gapminder_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop), 
            pop = sum(as.numeric(pop)))

plot2 <- ggplot(gapminder, aes(year, gdpPercap, color = continent)) + 
  geom_line(aes(group = country)) + 
  geom_point(aes(size = pop/100000, group = country)) + 
  geom_line(gapminder_continent, color = "black", aes(year, gdpPercapweighted)) + 
  geom_point(gapminder_continent, color = "black", aes(year, gdpPercapweighted, size = pop/100000)) +
  facet_wrap(~continent, nrow = 1) +
  theme_bw() +
  labs(x = "Year", y = "GDP per capita")
ggsave("Case_study_3_plot2.png", width = 17, height = 10, units = "cm") #took help from brendan for ggsave
print(plot2)

#plot 2 wasn't working. Re-shuffed some aesthetics from the 1st commit.