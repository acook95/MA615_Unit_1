# MA615_Unit_1

#Chapter 3 Exercises

library(tidyverse)
head(mpg)
?mpg

#look at the relationship between engine size (displ) and fuel efficiency (hwy)
mpg %>% ggplot() + geom_point(aes(x = displ, y = hwy))

#from the scatterplot above we can see that there is a negative relationship. The larger the engine, the smaller the highway mileage.