NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

EmissionsByYear <- split(NEI$Emissions, NEI$year)
totals <- sapply(EmissionsByYear,sum)
totals <- totals[]/1000
barplot(totals, main = main = expression('Total PM'[2.5]*' Emissions by Year'), 
        ylab = "Emissions (kilotons)",
        xlab = "Year")

