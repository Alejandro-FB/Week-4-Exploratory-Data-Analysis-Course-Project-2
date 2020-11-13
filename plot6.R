# Load Data Packages
library(ggplot2)

# Load Data Set
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Questions 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from 
# motor vehicle sources in Los Angeles County, California fips == 06037). 
# Which city has seen greater changes over time in motor vehicle emissions?

# Transformations
NEI$fips <- as.numeric(NEI$fips)
sub.NEI  <- NEI[(NEI$fips == 24510 | NEI$fips == 06037) & NEI$type == "ON-ROAD", ]
total.year_fips <- aggregate(Emissions ~ year + fips, sub.NEI, sum)

# Creating graph
png('plot6.png', width = 1280, height = 720)

ggplot(total.year_fips, aes(factor(year), Emissions)) + 
        facet_grid(. ~ fips) + 
        geom_bar(stat = "identity", color = "black", fill = heat.colors(8, alpha = 0.75)) +
        labs(title = "Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, MD (fips = 24510) vs Los Angeles, CA (fips = 06037)  1999-2008",
             x     = "year",
             y     = expression('Total PM'[2.5]*" Emissions"))

dev.off()
