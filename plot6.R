library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE) & 
     !(grepl("equipment", SCC$SCC.Level.Three, ignore.case = TRUE))
subSCC <- SCC[vehicles,]$SCC

NEIsub1 <- NEI[NEI$fips %in% c ('24510','06037'),]
NEIsub2 <- NEIsub1[NEIsub1$SCC %in% subSCC,]

NEIsub2$fips[NEIsub2$fips == '06037'] <- 'Los Angelos'
NEIsub2$fips[NEIsub2$fips == '24510'] <- 'Baltimore'

png('plot6.png')
plot6 <- ggplot(NEIsub2,aes(factor(year),Emissions)) +
     geom_bar(stat="identity") + 
     ggtitle(expression("PM"[2.5]*" Emissions from Motor Vehicles")) +
     ylab('Emissions (ton)') + xlab('Year') +
     facet_grid(.~fips)
dev.off()