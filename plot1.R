#read raw data into data frames
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#split the data up by year, and create a list where each entry corresponds to
#the total PM2.5 emissions in the corresponding year.
EmissionsByYear <- split(NEI$Emissions, NEI$year)
totals <- sapply(EmissionsByYear,sum)

png("plot1.png") #initialize graphics device

barplot(totals, 
        main = expression('Total PM'[2.5]*' Emissions by Year'), #title
        ylab = "Emissions (kilotons)",                           #y axis label
        xlab = "Year")                                           #x axis label
dev.off()
