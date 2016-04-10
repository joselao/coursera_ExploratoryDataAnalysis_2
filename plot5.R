# My working directory (not execute)
# setwd("~/Documents/COURSERA_COURSES/Data Science [Especialization]/04-Exploratory Data analysis_Rscripts/final_project")

# Reading data and filtering by date (with "READdata" function)
cat("\nReading data...")
source("ReadData.R")

## QUESTION 5
# 5) How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# looking for "Vehicle" words in SCC database
# grep("[Vv]ehicle", SCC$SCC.Level.Two, value=TRUE)
SCC$VEH <- grepl("[Vv]ehicle", SCC$SCC.Level.Two)

# merging SCC "VEH" columns into NEI database
cat("\nMerging data...")
NEI <- merge(NEI, SCC[,c("SCC","VEH")], by="SCC", all.x = TRUE)

# subsetting only Vehicle sources in Baltimore
NEI.sub <- subset(NEI, VEH==TRUE & fips=="24510")

# total emissions by year
TOT.emi <- tapply(NEI.sub$Emissions, INDEX = NEI.sub$year, FUN = sum)

### PLOTTING
# PLOT 5
png(filename = "plot5.png", width = 480, height = 480)
    barplot(TOT.emi, main="Vehicle emissions of PM2.5 in Baltimore City", ylab="PM2.5 [tons/y]", col="red")
dev.off()
cat("\nFinished.")

