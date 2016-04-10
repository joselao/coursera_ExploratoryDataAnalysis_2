# Exploratory Data Analysis
# WEEK 4 - Course Project 2
#################################################
# The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about
# fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package
# you want to support your analysis.

# reading data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#head(NEI)
#head(SCC)
#str(NEI)
#str(SCC)

# checking if there is other pollutants in the data
#table(NEI$Pollutant)

# checking how many year has the database
#table(NEI$year)

