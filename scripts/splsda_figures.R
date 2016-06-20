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
data_figs.pca <- data_stats.pca
data_figs.splsda <- data_stats.splsda
data_figs.plsda <- data_stats.plsda

## MAKE FILGURES ##
pdf('./figures/pca.pdf')
plotIndiv(data_figs.pca, col = data_figs.col, ind.names = FALSE, pch = 16)
dev.off()

pdf('./figures/splsda.pdf')
plotIndiv(data_figs.splsda, comp = 1:2, ind.names = FALSE, 
          col.per.group = data_figs.col, pch = 16, 
          group = srbct$class, add.legend = TRUE)
dev.off()

#In 3D
plotIndiv(data_figs.splsda, comp = 1:3, ind.names = FALSE, col = data_figs.col,
          cex = 0.25, axes.box = "both", style = "3d")

pdf('./figures/plsda.pdf')
plotIndiv(data_stats.plsda, comp = 1:2, ind.names = FALSE, 
          col = data_figs.col, pch = 16)
dev.off()

pdf('./figures/splsda_var.pdf')
plotVar(data_figs.splsda, comp = 1:2, var.names = list(srbct$gene.name[,1]))
dev.off()

#3D
plotVar(result, comp = 1:3, var.names  = list(srbct$gene.name[, 1]),
        style='3d',axes.box = 'axes')

pdf('./figures/splsda_error.pdf')
plot(error, type = "l")
dev.off()
