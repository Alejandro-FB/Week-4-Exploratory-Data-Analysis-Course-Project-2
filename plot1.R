# Load Data Set
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Questions 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.

# Transformations
total.year <- aggregate(Emissions ~ year, NEI, sum)

# Creating graph
png('plot1.png', width = 480, height = 480)

barplot(height = total.year$Emissions, 
        names.arg = total.year$year, 
        xlab = "years", 
        ylab = expression('total PM'[2.5]*' emission'),
        main = expression('Total PM'[2.5]*' emissions at various years'),
        col = heat.colors(4, alpha = 0.5))

dev.off()