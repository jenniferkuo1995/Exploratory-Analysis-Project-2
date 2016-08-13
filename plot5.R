library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE) & 
     !(grepl("equipment", SCC$SCC.Level.Three, ignore.case = TRUE))
subSCC <- SCC[vehicles,]$SCC

NEIBalt <- NEI[NEI$fips == '24510',]
NEIsub <- NEIBalt[NEIBalt$SCC %in% subSCC,]

plot5 <- ggplot(NEIsub,aes(factor(year),Emissions)) +
     geom_bar(stat="identity") + 
     ggtitle(expression("PM"[2.5]*" Emissions from Motor Vehicles in Baltimore")) +
     ylab('Emissions (ton)') + xlab('Year')