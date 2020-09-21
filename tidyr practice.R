library(tidyr)
library(tidyverse)
library(dplyr)
classroom <- read.csv("classroom.csv", stringsAsFactors = FALSE)
classroom2 <- classroom %>% 
  pivot_longer(quiz1:test1, names_to = "assessment", values_to = "grade") %>% 
  arrange(name, assessment)
classroom2
is.na(classroom)
sum(is.na(classroom))


View(mtcars)
tib_mtcars <- as_tibble(mtcars)
View(tib_mtcars)
