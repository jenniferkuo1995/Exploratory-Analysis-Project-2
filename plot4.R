library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalcomb <- grepl('Comb', SCC$EI.Sector) & grepl('Coal', SCC$EI.Sector)
SCCsub <- SCC[coalcomb,]$SCC
NEIsub <-NEI[NEI$SCC %in% SCCsub,]
plot4 <- ggplot(NEIsub,aes(factor(year),Emissions)) +
     geom_bar(stat="identity") +
     ggtitle(expression("Overall PM"[2.5]*" Emissions from Coal-Combustion Sources")) +
     ylab('Emissions (ton)') + xlab('Year')