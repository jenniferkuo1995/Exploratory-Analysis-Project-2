library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIBalt <- subset(NEI, fips == '24510')
bySource <- aggregate(NEIBalt$Emissions, list(type = NEIBalt$type, year = NEIBalt$year), sum)
names(bySource)[3] <- 'Emissions'
plot3 <- ggplot(bySource,aes(factor(year),Emissions,fill=type)) + 
     geom_bar(stat="identity") + theme(legend.position="none") + 
     facet_grid(.~type) +
     ggtitle("Total Emissions in Baltimore, MD by Source") +
     xlab('Year') + 
     ylab('Emissions (tons)')

