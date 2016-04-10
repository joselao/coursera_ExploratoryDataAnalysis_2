# My working directory (not execute)
# setwd("~/Documents/COURSERA_COURSES/Data Science [Especialization]/04-Exploratory Data analysis_Rscripts/final_project")

# Reading data and filtering by date (with "READdata" function)
cat("\nReading data...")
source("ReadData.R")

## QUESTION 4
# 4) Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# looking for "Coal" & "Combustion" words in SCC database
# grep("[Cc]oal", SCC$EI.Sector, value=TRUE)
# grep("[Cc]omb", SCC$EI.Sector, value=TRUE)
SCC$COAL <- grepl("[Cc]oal", SCC$EI.Sector)
SCC$COMB <- grepl("[Cc]omb", SCC$EI.Sector)
SCC$COALCOMB <- SCC$COAL * SCC$COMB

# merging SCC "COALCOMB" columns into NEI database
cat("\nMerging data...")
NEI <- merge(NEI, SCC[,c("SCC","COALCOMB")], by="SCC", all.x = TRUE)

# subsetting only COLA + COMBUSTION sources
NEI.sub <- subset(NEI, COALCOMB==1)

# total emissions by year
TOT.emi <- tapply(NEI.sub$Emissions, INDEX = NEI.sub$year, FUN = sum)

### PLOTTING
# PLOT 4
png(filename = "plot4.png", width = 480, height = 480)
    barplot(TOT.emi, main="Coal Combustion emissions of PM2.5 in the United States (all sources)", ylab="PM2.5 [tons/y]", col="grey")
dev.off()
cat("\nFinished.")