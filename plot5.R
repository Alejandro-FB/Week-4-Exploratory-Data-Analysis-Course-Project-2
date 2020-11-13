# Load Data Packages
library(ggplot2)

# Load Data Set
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Questions 5
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Transformations
NEI$fips <- as.numeric(NEI$fips)
sub.NEI  <- NEI[NEI$fips == 24510 & NEI$type == "ON-ROAD", ]
total.year <- aggregate(Emissions ~ year, sub.NEI, sum)

# Creating graph
png('plot5.png', width = 1280, height = 720)

ggplot(total.year, aes(factor(year), Emissions)) + 
        geom_bar(stat = "identity", color = "black", fill = heat.colors(4, alpha = 0.75)) +
        labs(title = "Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = 24510) from 1999 to 2008)",
             x     = "year",
             y     = expression('Total PM'[2.5]*" Emissions"))

dev.off()