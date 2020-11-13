# Load Data Packages
library(ggplot2)

# Load Data Set
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_SCC <- merge(NEI, SCC, by = "SCC")

# Questions 4
# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999–2008?

# Transformations
coal.matches <- grepl("coal", NEI_SCC$Short.Name, ignore.case = TRUE)
sub.NEI_SCC <- NEI_SCC[coal.matches, ]
total.year <- aggregate(Emissions ~ year, sub.NEI_SCC, sum)

# Creating graph
png('plot4.png', width = 1280, height = 720)

ggplot(total.year, aes(factor(year), Emissions)) + 
        geom_bar(stat = "identity", color = "black", fill = heat.colors(4, alpha = 0.75)) +
        labs(title = "Total Emissions from coal sources from 1999 to 2008",
             x     = "year",
             y     = expression('Total PM'[2.5]*" Emissions"))

dev.off()