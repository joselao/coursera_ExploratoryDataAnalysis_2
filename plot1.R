# My working directory (not execute)
# setwd("~/Documents/COURSERA_COURSES/Data Science [Especialization]/04-Exploratory Data analysis_Rscripts/final_project")

# Reading data and filtering by date (with "READdata" function)
cat("\nReading data...")
source("ReadData.R")

## QUESTION 1
# 1) Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#    Using the base plotting system, make a plot showing the total PM2.5 emission from all
#    sources for each of the years 1999, 2002, 2005, and 2008.

# total emissions by year
TOT.emi <- tapply(NEI$Emissions, INDEX = NEI$year, FUN = sum)

### PLOTTING
# PLOT 1
png(filename = "plot1.png", width = 480, height = 480)
    barplot(TOT.emi, main="Total emissions of PM2.5 in the United States (all sources)", ylab="PM2.5 [tons/y]", col="blue")
dev.off()
cat("\nFinished.")
