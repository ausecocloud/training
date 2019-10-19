### Biodiversity_Next 2019 ###
### Sunday 20 October      ###
### ecocloud workshop      ###

## Set working directory
setwd("/home/jovyan/workspace/biodiversity_next")
getwd()

## Load libraries
library(dismo)
library(rgdal)
library(sp)
library(maptools)

## Get species data from GBIF
pika <- gbif('Ochotona', 'princeps', geo=TRUE, removeZeros=TRUE, download=TRUE)
pika #shows number of records
head(pika) #shows first 6 rows of dataset
str(pika) #structure of the dataframe listing all columns

## Save the data as a csv file
write.csv(pika, file = "ochotona-princeps_gbif.csv",row.names = TRUE)

## Load the data as a dataframe with a generic name (easy for future use with a different species)
spp.data <- pika

## Create a new dataframe with only relevant columns for data filtering
records <- data.frame(
  idNum=c(spp.data$gbifID),
  species=c(spp.data$acceptedScientificName),
  longitude=c(spp.data$lon),
  latitude=c(spp.data$lat),
  year=c(spp.data$year),
  coordUncer=c(spp.data$coordinateUncertaintyInMeters) 
)

head(records)
summary(records)

## Remove records with missing latitude/longitude values
records <- records[-which(is.na(records$longitude) | is.na(records$latitude)), ]
nrow(records)
head(records)
summary(records)

## Check the coordinate uncertainty of the occurrence data
min(records$coordUncer, na.rm=TRUE)
max(records$coordUncer, na.rm=TRUE)

## Remove all records with a coordinate uncertainty that is larger than 10km
records.selection <- records[records$coordUncer<=10000, ]
hist(records.selection$coordUncer,
     xlab='Coordinate Uncertainty',
     ylab='Number of records',
     main='Coordinate uncertainty (m)'
)

min(records.selection$coordUncer, na.rm=TRUE)
max(records.selection$coordUncer, na.rm=TRUE)
nrow(records.selection) #check number of records left

## Check the year range of the occurrence data
hist(records.selection$year,
     xlab='Collection year',
     ylab='Number of records',
     main='Collection year (all years)'
)

min(records.selection$year, na.rm=TRUE)
max(records.selection$year, na.rm=TRUE)

## Make a selection of records within a given year range
records.selection <- records.selection[records.selection$year >=1970 & records.selection$year <=2000, ]
hist(records.selection$year,
     xlab='Collection year',
     ylab='Number of records',
     main='Collection year (1970-2000)'
)

min(records.selection$year, na.rm=TRUE) #double check earliest year = 1970
max(records.selection$year, na.rm=TRUE) #double check latest year = 2000
nrow(records.selection) # check how many records are left

## Plot species occurrence data on a map
data(wrld_simpl) #load world country polygons from maptools package
plot(wrld_simpl, xlim=c(-130,-60), ylim=c(10,60), axes=TRUE, col="light yellow")
box() #add box around map
points(records.selection$longitude, records.selection$latitude, col="red", pch=20, cex=0.75)









