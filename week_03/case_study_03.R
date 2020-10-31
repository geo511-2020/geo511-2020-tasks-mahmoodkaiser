library(gapminder)
library(ggplot2)
library(dplyr)

#viewing data
#gapminder

#removing Kuwait
gapminder <- gapminder %>%
  filter(country!="Kuwait")

gapminder

#Plot 1
ggplot(gapminder,aes(lifeExp,gdpPercap,color=continent, size=pop/100000)) +
  geom_point() +
  scale_y_continuous(trans = "sqrt") +
  facet_wrap(~year,nrow = 1) +
  theme_bw() +
  labs(x="Life Expectancy",y="GDP per capita")
ggsave("Case_study_3_plot1.png", width = 17, height = 10, units = "cm")

#plot 2
gapminder_continent <- gapminder %>%
  group_by(year,continent) %>%
  summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop),
            pop = sum(as.numeric(pop)))
gapminder_continent

ggplot(gapminder_continent,aes(year,gdpPercapweighted,color=continent, size=pop/100000)) +
  geom_line() +
  geom_point() +
  geom_line(data=gapminder,aes(year,gdpPercap,color= "black", group = country)) +
  geom_point(data=gapminder,aes(year,gdpPercap,color= "black", size=pop/100000)) +
  facet_wrap(~continent,nrow=1) +
  theme_bw() +
  labs(x= "Year", y="GDP per capita")
ggsave("Case_study_3_plot2.png", width = 17, height = 10, units = "cm") 