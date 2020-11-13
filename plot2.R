# Load Data Set
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Questions 2
# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# Transformations
NEI$fips <- as.numeric(NEI$fips)
sub.NEI  <- NEI[NEI$fips == 24510, ]
total.year <- aggregate(Emissions ~ year, sub.NEI, sum)

# Creating graph
png('plot2.png', width = 480, height = 480)

barplot(height = total.year$Emissions, 
        names.arg = total.year$year, 
        xlab = "years", 
        ylab = expression('total PM'[2.5]*' emission'),
        main = expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'),
        col = heat.colors(4, alpha = 0.5))

dev.off()