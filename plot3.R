# Load Data Packages
library(ggplot2)

# Load Data Set
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Questions 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system 
# to make a plot answer this question.

# Transformations
NEI$fips <- as.numeric(NEI$fips)
sub.NEI  <- NEI[NEI$fips == 24510, ]
total.year_tipe <- aggregate(Emissions ~ year + type, sub.NEI, sum)

# Creating graph
png('plot3.png', width = 1280, height = 720)

ggplot(total.year_tipe, aes(year, Emissions, color = type)) + 
        geom_line() +
        labs(title = "Total Emissions in Baltimore City, Maryland (fips == 24510) from 1999 to 2008",
             x     = "year",
             y     = expression('Total PM'[2.5]*" Emissions"))

dev.off()