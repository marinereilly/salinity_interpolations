#If you don't have the salinity kayak package:
devtools::install_github("marinereilly/salinitykayak")

#load packages
library(tidyverse)
library(salinitykayak)
library(sf)
library(tmaptools)
library(readxl)


#load salinity data
salinity_master<-read_excel(path = "H:/0_HarrisLab/1_CURRENT PROJECT FOLDERS/Dominion/01_new_dominion/surveys/salinity_kayak/data/2018/2018_SalinityProfiles_DOMINION.xlsx",
                            sheet= 2)
#Check to make sure there aren't waypoint overlaps if there are no values greater than 1 you are okay!
a<-ggplot(salinity_master)+
  geom_histogram(aes(Waypoint), binwidth = 1)+theme_minimal()
a

#run function; replace salinity_MM_DD_YYYY with the name of the gpx file (no .gpx)
#this loads the data, formats the data, joins the data, and writes a new shapefile!
salinity_wrangle("salinity_MM_DD_YYYY")

