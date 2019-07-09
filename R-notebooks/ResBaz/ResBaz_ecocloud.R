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
