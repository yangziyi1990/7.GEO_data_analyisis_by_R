getwd()
setwd("C:\\Users\\yangziyi\\Desktop\\R")
# example: https://www.jianshu.com/p/07ecff240548

library(GEOquery)
library(simpleaffy)
library(RColorBrewer)
library(affyPLM)

biocLite("hgu133plus2.db")
library(hgu133plus2.db)
library(annotate)

getGEOSuppFiles("GSE20986")
untar("GSE20986/GSE20986_RAW.tar", exdir="data")
cels <- list.files("data/", pattern = "[gz]")
sapply(paste("data", cels, sep="/"), gunzip)
celfiles <- read.affy(covdesc="phenodata.txt", path="data")

# data normalization
celfiles.gcrma <- gcrma(celfiles)

# Data quality control #
cols <- brewer.pal(8, "Set1")
boxplot(celfiles, col=cols)
boxplot(celfiles.gcrma, col=cols)
hist(celfiles, col=cols)
hist(celfiles.gcrma, col=cols)

# annotation #
expMatrix=exprs(celfiles.gcrma)
prob_id<-rownames(expMatrix)
symbols <- getSYMBOL(prob_id, "hgu133plus2")
results<-cbind(expMatrix,symbols)
results_nonna<-na.omit(results)
results_nonna<-data.frame(results_nonna)

# Output #
write.table(results_nonna,file="GSE20986.txt",sep="\t")

