## READ IN DATA ##
source("scripts/splsda_cleaning.R")

## LOAD PACKAGE ##
library(mixOmics)

## ORGANIZE DATA ##
data_stats.X <- X
data_stats.Y <- Y

## BUILD MODEL ##
data_stats.pca <- pca(data_stats.X, ncomp = 3, center = TRUE, scale = TRUE)

data_stats.splsda <- splsda(data_stats.X,data_stats.Y, ncomp = 3, keepX = c(50,50,50))

data_stats.plsda <- splsda(data_stats.X, data_stats.Y, ncomp = 3)