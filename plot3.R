# My working directory (not execute)
# setwd("~/Documents/COURSERA_COURSES/Data Science [Especialization]/04-Exploratory Data analysis_Rscripts/final_project")

# Reading data and filtering by date (with "READdata" function)
cat("\nReading data...")
source("ReadData.R")

## QUESTION 3
# 3) Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which  
#    of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
#    Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot
#    answer this question.

require(ggplot2)
require(plyr)

# subsetting Baltimor city
NEI.sub <- subset(NEI, fips=="24510")

# total emissions by year and type
TOT.emi <- ddply(NEI.sub, .(type, year), summarise, Emissions=sum(Emissions, na.rm=TRUE))
TOT.emi$year <- factor(TOT.emi$year)

### PLOTTING
# PLOT 3
png(filename = "plot3.png", width = 960, height = 480)
    ggp <- ggplot(TOT.emi, aes(x=year, y=Emissions, fill=type)) + geom_bar(stat = "identity") + facet_grid(.~type)
    ggp <- ggp + labs(title = "Total emissions of PM2.5 in Baltimore City, Maryland (by sources)") + labs(y ="PM2.5 [tons/y]")
    ggp <- ggp + geom_text(aes(x=year, y=Emissions, label=paste0(round(Emissions,1)," t/y")))
    plot(ggp)
dev.off()
cat("\nFinished.")

