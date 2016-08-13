NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIBalt <- NEI[NEI$fips == '24510',]
BaltByYear <- split(NEIBalt$Emissions, NEIBalt$year)
totals <- sapply(BaltByYear,sum)
barplot(totals, main = expression('Total PM'[2.5]*' Emissions in Baltimore City, MD'), 
        ylab = "Emissions (tons)",
        xlab = "Year")