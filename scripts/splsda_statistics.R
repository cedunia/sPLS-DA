## READ IN DATA ##
source("scripts/splsda_cleaning.R")

## LOAD PACKAGE ##
library(mixOmics)

## ORGANIZE DATA ##
data_stats <- X
data_stats.pca <- pca(X, ncomp = 3, center = TRUE, scale = TRUE)