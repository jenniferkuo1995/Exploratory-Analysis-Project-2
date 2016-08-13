#read raw data into data frames
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#split Baltimore Emissions up by Year, then sum them up by Year.
NEIBalt <- NEI[NEI$fips == '24510',] #subset of data for Baltimore
BaltByYear <- split(NEIBalt$Emissions, NEIBalt$year)
totals <- sapply(BaltByYear,sum)

png('plot2.png') #initialize graphics device

barplot(totals, 
        main = expression('Total PM'[2.5]*' Emissions in Baltimore'), #title
        ylab = "Emissions (tons)",         #y axis label
        xlab = "Year")                     #x axis label

dev.off()