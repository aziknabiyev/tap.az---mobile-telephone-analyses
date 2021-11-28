library(tidyverse)
library(dplyr)
library(ggplot2)
library(readr)
library(stringr)

jobs <- read.csv("telefonlar.csv",encoding="UTF-8", stringsAsFactors=FALSE)
cr <- group_by(jobs,marka) %>% summarise(n=n())
cr <- subset(cr,marka!='Aksesuarlar')
cr <- subset(cr,n>10)
View(cr)

ggplot(data=cr, mapping=aes(x=marka,y=n,fill=marka))+
  geom_bar(position = 'dodge', stat='identity') +
  geom_text(aes(label=marka), position=position_dodge(width=0.2), vjust=-0.50)+
  
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
# cr <- subset(jobs, marka=='Honor') 
# cr$price <- as.numeric(cr$price)
# cr <- group_by(cr,model) %>% summarise(mean_price = mean(price),
#                                          n=n())
# 
# cr <- subset(cr,n>1)
# cr <- subset(cr,mean_price>100)
# 
# cr <- cr[order(cr$mean_price),]
# 
# View(cr)

  

