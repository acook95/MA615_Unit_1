# MA615_Unit_1

#Chapter 3 Exercises

library(tidyverse)
head(mpg)
?mpg

#look at the relationship between engine size (displ) and fuel efficiency (hwy)

mpg %>% ggplot() + geom_point(aes(x = displ, y = hwy))

#from the scatterplot above we can see that there is a negative relationship. The larger the engine, the smaller the highway mileage.

#3.2.4

ggplot(data=mpg)
nrow(mpg)
ncol(mpg)
ggplot(data=mpg) + 
  geom_point(aes(x = cyl, y = hwy))
ggplot(data = mpg) + 
  geom_point(aes(x = drv, y = cyl))

#3.3.1

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
?mpg
head(mpg)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = cty))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = cty))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = cyl, color = cyl))

?geom_point

ggplot(data=mpg) + geom_point(aes(x = displ, y = hwy, stroke = cyl))
ggplot(data=mpg) + geom_point(aes(x = displ, y = hwy, stroke = cty))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))

#facets

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
  
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

#3.5.1

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(~ cty)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)  
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)  
  
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
?facet_wrap
?facet_grid


#geoms

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))  

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))  
?geom_smooth  
  
  