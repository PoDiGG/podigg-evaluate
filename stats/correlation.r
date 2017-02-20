library(psych)

region_cells_BE <- read.csv('../data/train_BE/region_cells.csv')
subset_BE <- region_cells_BE[which(region_cells_BE$density>0 & region_cells_BE$density<30),]

biserial(region_cells_BE$density, region_cells_BE$hasstop) # 0.1756958
biserial(subset_BE$density, subset_BE$hasstop) # 0.4397582
# Outliers distort the correlation a lot!
# We only take a subset_BE of the data, with which we get a correlation of 0.4397582
boxplot(density~hasstop, data=subset_BE)

region_cells_NL <- read.csv('../data/train_NL/region_cells.csv')
subset_NL <- region_cells_NL[which(region_cells_NL$density>0 & region_cells_NL$density<6.3),]

biserial(region_cells_NL$density, region_cells_NL$hasstop) # 0.8780911
biserial(subset_NL$density, subset_NL$hasstop) # 0.4599671
# Outliers distort the correlation a lot!
# We only take a subset_NL of the data, with which we get a correlation of 0.4397582
boxplot(density~hasstop, data=subset_NL)