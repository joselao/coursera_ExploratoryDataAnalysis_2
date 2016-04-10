# My working directory (not execute)
# setwd("~/Documents/COURSERA_COURSES/Data Science [Especialization]/04-Exploratory Data analysis_Rscripts/final_project")

# Reading data and filtering by date (with "READdata" function)
cat("\nReading data...")
source("ReadData.R")

## QUESTION 2
# 2) Have total emissions from PM2.5 decreased in the Baltimore City,
#    Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# subsetting Baltimor city
NEI.sub <- subset(NEI, fips=="24510")

# total emissions by year
TOT.emi <- tapply(NEI.sub$Emissions, INDEX = NEI.sub$year, FUN = sum)

### PLOTTING
# PLOT 2
png(filename = "plot2.png", width = 480, height = 480)
    barplot(TOT.emi, main="Total emissions of PM2.5 in Baltimore City, Maryland (all sources)", ylab="PM2.5 [tons/y]", col="green")
dev.off()
cat("\nFinished.")