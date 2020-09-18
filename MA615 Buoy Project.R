library(tidyverse)

library(stringr)





### make URLs



url1 <- "http://www.ndbc.noaa.gov/view_text_file.php?filename=mlrf1h"

url2 <- ".txt.gz&dir=data/historical/stdmet/"



years <- c(2000:2018)



urls <- str_c(url1, years, url2, sep = "")



filenames <- str_c("mr", years, sep = "")



###  Read the data from the website

#file2 <- data.frame(file$YYYY,file$ATMP)
#colnames(file2)[1] <- "YYYY"
#colnames(file2)[2] <- "ATMP"
#file3 <- data.frame(MR$YYYY,MR$ATMP)
#colnames(file3)[1] <- "YYYY"
#colnames(file3)[2] <- "ATMP"
#file4 <- rbind.data.frame(file2,file3)


N <- length(urls)



for (i in 1:N){
  
  suppressMessages(  ###  This stops the annoying messages on your screen.  Do this last.
    
    assign(filenames[i], read_table(urls[i], col_names = TRUE, na = ""))
    
  )
  
  file <- get(filenames[i])
  
  colnames(file)[1] <-"YYYY"
 
  file2 <- select(file, YYYY, MM, DD, hh, ATMP)
  # put '19' in front of 2 digit years
  
  # check that all columns are included
  
  # filter down to only the 1 daily observation that you want
  
  # etc etc etc

  
  
  
  
  if(i == 1){
    
    MR <- file2
    
  }
  
  
  
  else{
    
    MR <- rbind.data.frame(MR, file2)
    
  }
  
  
  
  
  
  
  
}

MR2 <- filter(MR, DD==11, hh==12, ATMP<500)

MR3 <- select(MR2, YYYY, MM, ATMP)

MR4 <- transform(MR3, YYYY= as.numeric(YYYY), MM= as.numeric(MM), ATMP= as.numeric(ATMP))

MR5 <- unite(MR4, DATE, YYYY, MM, sep = "-")
MR6 <- mutate(MR5, MONTH = 0:211)

ggplot(data=MR6, aes(MONTH, ATMP)) + geom_point()

fit <- stan_glm(ATMP ~ MONTH, data = MR6, refresh=0)
fit


# hi this is jenna
#And Bruce
