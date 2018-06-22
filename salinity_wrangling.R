#if you don't have the salinity kayak package installed use this code
library(devtools)
install_github("marinereilly/salinitykayak")
#load packages
library(salinitykayak)
library(tidyverse)
library(sf)
library(tmaptools)
library(readxl)


salinity_master<-read_excel(path = "H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/salinity_kayak/data/2018/2018_SalinityProfiles_DOMINION.xlsx",
                            sheet= 2, col_types = c("text", "text", "numeric", "numeric","numeric","numeric","numeric", "text", "text", "text", "skip"))
#check the histogram to make sure there aren't more than one waypoint in the database
a<-ggplot(salinity_master)+
  geom_histogram(aes(Waypoint), binwidth = 1)
a

#make the shapefile!!!
salinity_wrangle("salinity_06_11_2018")
