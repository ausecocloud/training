### ResBaz Brisbane 2019 ###
### Wednesday 10 July    ###
### ecocloud workshop    ###

## Set working directory
setwd("/home/jovyan/workspace/ResBaz")
getwd

## Install packages
library(tidyr)
library(ggplot2)
library(reshape2)
library(readr)
library(Hmisc)
install.packages("corrplot")
library(corrplot)

## Load the data file into R
occurrence <- read.csv("occurrence_environmental_Eucalyptus.regnans_maxent.csv")

## Check your data - this shows the first 6 rows of the datafile
head(occurrence)

## Generate summary boxplots
# For temperature variables
boxplot(occurrence[, c("B01", "B05", "B06")], #change B01 etc to the variables in your model
        xlab = "Climate Variables",
        ylab = "Temperature (C)")

# For rainfall variables
boxplot(occurrence[, c("B12", "B13", "B14")], #change B01 etc to the variables in your model
        xlab = "Climate Variables",
        ylab = "Precipitation")

## Generate summary histograms
ggplot(melt(occurrence[,4:10]),aes(x=value)) + geom_histogram() + facet_wrap(~variable, scales = "free")

## Generate a correlation plot for your predictor variables
main_variables <- subset(occurrence[,4:10])
variable_correlations <- cor(main_variables, method="pearson")
corrplot(variable_correlations, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)


