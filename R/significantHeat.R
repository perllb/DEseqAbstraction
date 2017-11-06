#' @name mostSignificantHeat
#' @description Plots heatmap showing the expression of most variable genes
#' @param data: normalized deseq matrix data (with varianceStablizing, rlog etc - eg. assay(vsd)
#' @param test: output from results(dds)
#' @param ntop: how many genes to display (the <ntop> most variable genes)
#' @param a1: annotation of the samples
#' @param a2: annotation of the samples
#' @param n1: name of annotation in a1
#' @param n2: name of annotation in a2
#' @title Plot most significant genes: heatmap
#' @export mostSignificantHeat
#' @example
#' vst <- varianceStabilizingTransformation(dds)
#' test <- results(dds)
#' mostSignificantHeat(data = assay(vst),test=test,ntop = 100, a1 = colData$cellLine, a2 = colData$treatment,n1="Cell Line",n2="Treatment")

mostSignificantHeat <- function(data,test,ntop=50,a1=NULL,a2=NULL,n1=NULL,n2=NULL) {

  library(graphics)

  ordered <- test[order(test$padj),]
  top <- rownames(ordered)[1:ntop]
  merge <- merge(top,data,by.x=1,by.y=0)
  rownames(merge) <- merge[,1]
  plotData <- merge[,-1]

  #show rownames if 40 or less genes are plotted
  rowShow <- T
  if(ntop>50) { rowShow <- F }

  if (!is.null(a1) & is.null(a2)) {

    df <- data.frame(Var1 = factor(a1))
    rownames(df) <- colnames(data)
    colnames(df) <- n1
    pheatmap(plot, annotation_col = df, cluster_rows = T, show_rownames = rowShow, cluster_cols = T)

  } else if (!is.null(a1) & !is.null(a2)) {

    df <- data.frame(Var1 = factor(a1), Var2 = factor(a2))
    rownames(df) <- colnames(data)
    colnames(df) <- c(n1,n2)
    pheatmap(plotData, annotation_col = df, cluster_rows = T, show_rownames = rowShow, cluster_cols = T)

  } else if (!is.null(a2) & is.null(a1)) {

    df <- data.frame(Var1 = factor(a2))
    rownames(df) <- colnames(data)
    colnames(df) <- n2
    pheatmap(plotData, annotation_col = df, cluster_rows = T, show_rownames = rowShow, cluster_cols = T)

  } else {
    pheatmap(plotData, cluster_rows = T, show_rownames = rowShow, cluster_cols = T)
  }
}