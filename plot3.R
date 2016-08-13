library("ggplot2")

#read raw data into data frames
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset of data for Baltimore
NEIBalt <- subset(NEI, fips == '24510') 

#Sum PM2.5 emissions by source
bySource <- aggregate(NEIBalt$Emissions, list(type = NEIBalt$type, year = NEIBalt$year), sum)
names(bySource)[3] <- 'Emissions'

png('plot3.png')   #initialize graphics device

plot3 <- ggplot(bySource,aes(factor(year),Emissions,fill=type)) + #initialize graph
     geom_bar(stat="identity") + theme(legend.position="none") +  #make barplot
     facet_grid(.~type) +                                         #four barplots, according to Source
     ggtitle("Total Emissions in Baltimore, MD by Source") +      #graph title
     xlab('Year') + 
     ylab('Emissions (tons)')

plot3 #print graph

dev.off()
