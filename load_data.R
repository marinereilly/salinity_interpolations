#load packages
library(tidyverse)
library(salinitykayak)
library(dadjoke)
library(sf)
library(tmaptools)
library(readxl)
library(lubridate)

#load salinity data
salinity_master<-read_excel(path = "H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/salinity_kayak/data/2018/2018_SalinityProfiles_DOMINION.xlsx",
                            sheet= 2)
#Check to make sure there aren't waypoint overlaps if there are no values greater than 1 you are okay!
a<-ggplot(salinity_master)+
  geom_histogram(aes(Waypoint), binwidth = 1)+theme_minimal()
a

#load GPX data
sal1<-read_GPX(file = "H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/01_GPS_waypoints/2018/salinity_02_14_2018.gpx", 
               layers=c("waypoints"), as.sf = TRUE)
sal2<-read_GPX(file = "H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/01_GPS_waypoints/2018/salinity_02_28_2018.gpx",
               layers=c("waypoints"), as.sf = TRUE)

#run function
sal1<-salinity_format(sal1)
sal2<-salinity_format(sal2)
