## READ IN DATA ##
source("./scripts/splsda_statistics.R")

## LOAD PACKAGE ##
library(mixOmics)

## ORGANIZE DATA ##
cols <- c('#e41a1c','#377eb8','#4daf4a','#984ea3')
data_figs.col <- factor(srbct$class, levels = cols)
data_figs.col <- as.numeric(as.factor(srbct$class))
data_figs.col <- ifelse(data_figs.col == 1, cols[1],
                        ifelse(data_figs.col == 2, cols[2],
                               ifelse(data_figs.col == 3, cols[3], 
                                      cols[4])))
data_figs <- data_stats.pca

## MAKE FILGURES ##
pdf('./figures/pca.pdf')
plotIndiv(data_figs, col = data_figs.col, ind.names = FALSE, pch = 16)
dev.off()

