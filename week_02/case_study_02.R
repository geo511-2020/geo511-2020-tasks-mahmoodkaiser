library(tidyverse)

dataurl="https://raw.githubusercontent.com/AdamWilsonLab/GEO511/master/CS_02.csv"

temp=read_csv(dataurl,
              skip=1, #skip the first line which has column names
              na="999.90", # tell R that 999.90 means missing in this dataset
              col_names = c("YEAR","JAN","FEB","MAR", # define column names 
                            "APR","MAY","JUN","JUL",  
                            "AUG","SEP","OCT","NOV",  
                            "DEC","DJF","MAM","JJA",  
                            "SON","metANN"))

summary(temp)

annual_mean_temp <- ggplot(temp,aes(YEAR,JJA)) + geom_line() +
  geom_smooth(color="red") +
  xlab("Year") +
  ylab("Mean Summer Temperature") +
  ggtitle("Mean Summer Temperature in Buffalo, NY",
          subtitle = "Summer inclueds June, July, and August\nData from the Global Historical Climate Network\nRed line is a LOESS smooth" )
ggsave("Case_study 2.png", width = 17, height = 10, units = "cm") #code from brandan. I'm not sure where the picture is being saved.
annual_mean_temp 