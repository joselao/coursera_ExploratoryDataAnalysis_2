# My working directory (not execute)
# setwd("~/Documents/COURSERA_COURSES/Data Science [Especialization]/04-Exploratory Data analysis_Rscripts/final_project")

# Reading data and filtering by date (with "READdata" function)
cat("\nReading data...")
source("ReadData.R")

## QUESTION 6
# 6) Compare emissions from motor vehicle sources in Baltimore City with emissions from motor
#    vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?

require(ggplot2)
require(plyr)

# looking for "Vehicle" words in SCC database
# grep("[Vv]ehicle", SCC$SCC.Level.Two, value=TRUE)
SCC$VEH <- grepl("[Vv]ehicle", SCC$SCC.Level.Two)

# merging SCC "VEH" columns into NEI database
cat("\nMerging data...")
NEI <- merge(NEI, SCC[,c("SCC","VEH")], by="SCC", all.x = TRUE)

# subsetting only Vehicle sources
NEI.sub <- subset(NEI, VEH==TRUE)

# subsetting Baltimore (24510) & Los Angeles County (𝟶𝟼𝟶𝟹𝟽)
NEI.sub <- subset(NEI, fips=="24510" | fips=="06037")

# total emissions by year
TOT.emi <- ddply(NEI.sub, .(fips, year), summarise, Emissions=sum(Emissions, na.rm=TRUE))
TOT.emi$year <- factor(TOT.emi$year)
TOT.emi$fips <- factor(TOT.emi$fips, labels=c("Los Angeles County","Baltimore"))

### PLOTTING
# PLOT 6
png(filename = "plot6.png", width = 960, height = 480)
    ggp <- ggplot(TOT.emi, aes(x=year, y=Emissions, fill=fips)) + geom_bar(stat = "identity") + facet_grid(.~fips)
    ggp <- ggp + labs(title = "Vehicle motor emissions of PM2.5 in Baltimore and Los Angeles County") + labs(y ="PM2.5 [tons/y]")
    ggp <- ggp + geom_text(aes(x=year, y=Emissions, label=paste0(round(Emissions,1)," t/y")))
    plot(ggp)
dev.off()
cat("\nFinished.")
